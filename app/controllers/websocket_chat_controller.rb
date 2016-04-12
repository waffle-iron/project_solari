# WebsocketRails::BaseControllerを継承

class WebsocketChatController < WebsocketRails::BaseController
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
