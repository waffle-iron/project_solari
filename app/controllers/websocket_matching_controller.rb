# coding: utf-8
# WebsocketRails::BaseControllerを継承
class WebsocketMatchingController < WebsocketRails::BaseController
  def initialize_session
    logger.debug("initialize chat controller")
  end

  def connect_user
    logger.debug("connected user")
  end

  def exit_room
    matching = Matching.find(message[:id])
    member_num = matching.exit_room(message[:token])

    message[:member_id] = member_num
    message[:summoner_name] = ""

    #TODO ブロードキャストの一元化
    WebsocketRails["matching" + message[:id]].trigger(:role_changed, message)

  end

  def role_changed
    matching = Matching.find(message[:id])
    member_num, summoner_name = matching.set_role_with_token(token: message[:token], top: message[:top], mid: message[:mid], bot: message[:bot], sup: message[:sup], jg: message[:jg])
    message[:member_id] = member_num
    message[:summoner_name] = summoner_name

    #TODO ブロードキャストの一元化
    WebsocketRails["matching" + message[:id]].trigger(:role_changed, message)

  end

end
