# WebsocketRails::BaseControllerを継承

class WebsocketChatController < WebsocketRails::BaseController
  def initialize_session
    logger.debug("initialize chat controller")
#    @redis = Redis.new(:host => "127.0.0.1", :port => 6379)
#    controller_store[:redis] = @redis
  end

  def connect_user
    logger.debug("connected user")
    send_message :websocket_chat, "log"
#    talks = controller_store[:redis].lrange gid, 0,100
#    talks.each do |message|
#      msg = ActiveSupport::HashWithIndifferentAccess.new(eval(message))
#      send_message :new_message, msg
#    end
  end

  def message_recieve
    # クライアントからのメッセージを取得
    recieve_message = message()
    logger.debug("recieve_message#{recieve_message}")
    time = Time.now
    puts("time",time,recieve_message)

    # websocket_chatイベントで接続している全クライアントにブロードキャスト
#    broadcast_message(:websocket_chat, recieve_message)

    # チャンネルごとにブロードキャスト
    recieve_message[:body] = "^v^"
    WebSocketRails["teamchat_channel#{recieve_message[:teamID]}"].trigger(:websocket_chat, recieve_message)

  end
end
