# WebsocketRails::BaseControllerを継承
class WebsocketChatController < WebsocketRails::BaseController
  def initialize_session
    logger.debug("initialize chat controller")
    # @redis = Redis.new(:host => "127.0.0.1", :port => 6379)
    # controller_store[:redis] = @redis
  end

  def connect_user
    logger.debug("connected user")
    # session[:teamid]
    send_message :new_message, { time: :past, user_id: :user , body: :message , team_id: :team_id }
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

  def message_recieve
    # クライアントからのメッセージを取得
    recieve_message = message()
    channel = "teamchat_channel" + recieve_message[:teamID]
    time = Time.now
    puts("time",time,channel,recieve_message)

    # websocket_chatイベントで接続している全クライアントにブロードキャスト
#    broadcast_message(:websocket_chat, recieve_message)

    # チャンネルごとにブロードキャスト
    WebSocketRails[channel].trigger(:websocket_chat, recieve_message)
  end

end
