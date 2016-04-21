# WebsocketRails::BaseControllerを継承
class WebsocketChatController < WebsocketRails::BaseController
  def initialize_session
    logger.debug("initialize chat controller")
  end

  def connect_user
    logger.debug("connected user")
    end

  def new_message
    logger.debug("Call new_message : #{message}")
    # if message[:team_id] != session[:team_id] or message[:user_id] != session[:user_id] then
    #   logger.debug("message is invalid")
    #   return
    # end
    message[:time] = Time.now.to_s
    WebsocketRails[message[:team_id]].trigger(:new_message, message)
    # broadcast_message :new_message, message
  end

end
