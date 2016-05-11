# coding: utf-8
# WebsocketRails::BaseControllerを継承
class WebsocketChatController < WebsocketRails::BaseController
  def initialize_session
#    logger.debug("initialize chat controller")
  end

  def connect_user
#    logger.debug("connected user")
  end

  def new_message
#    logger.debug("Call new_message : #{message}")
    # if message[:team_id] != session[:team_id] or message[:user_id] != session[:user_id] then
    #   logger.debug("message is invalid")
    #   return
    # end

    message[:time] = Time.now.to_s

    puts message
    if message[:teamonly]
      chat = Teamonlychat.new
      chat.user_id = message[:user_id]
      chat.team_id = message[:team_id]
      chat.body = message[:body]
      chat.is_valid?
      puts "ok?"
      if chat.is_valid?
        if chat.save!
        #      logger.debug("save:"+message)
        else
          logger.debug("save failed: "+message)
        end
        WebsocketRails[message[:team_id]].trigger(:new_message, message)
      end
    else
      chat = Teamchat.new
      chat.user_id = message[:user_id]
      chat.team_id = message[:team_id]
      chat.body = message[:body]
      if chat.save!
      #      logger.debug("save:"+message)
      else
        logger.debug("save failed: "+message)
      end
      WebsocketRails[message[:team_id]].trigger(:new_message, message)
    end
  end

end
