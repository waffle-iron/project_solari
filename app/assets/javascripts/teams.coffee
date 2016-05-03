# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @ChatClass
  constructor: (url, useWebsocket) ->
    # ソケットのディスパッチャー
    team_id = $('#team_id').text()
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channel = @dispatcher.subscribe(team_id)
    # イベントを監視
    @bindEvents()

  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('#send_teamchat').on 'click', @sendTeamMessage
    $('#send_teamonlychat').on 'click', @sendTeamOnlyMessage
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
    @dispatcher.bind 'new_message', @receiveMessage
    @channel.bind 'new_message', @receiveMessage

  sendTeamMessage: (event) =>
    console.log("teammessage")
    # サーバ側にsend_messageのイベントを送信
    user_id = $('#user_id').text()
    msg_body = $('#team_msgbody').val()
    team_id = $('#team_id').text()
    if msg_body == ""
      return
    @dispatcher.trigger 'new_message', { user_id: user_id, body: msg_body, team_id: team_id, teamonly: false }
    $('#team_msgbody').val('')

  sendTeamOnlyMessage: (event) =>
    console.log("teamonlymessage")
    # サーバ側にsend_messageのイベントを送信
    user_id = $('#user_id').text()
    msg_body = $('#teamonly_msgbody').val()
    team_id = $('#team_id').text()
    if msg_body == ""
      return
    @dispatcher.trigger 'new_message', { user_id: user_id, body: msg_body, team_id: team_id, teamonly: true }
    $('#teamonly_msgbody').val('')

  receiveMessage: (message) =>
    console.log message
    # 受け取ったデータをappend
    if message.teamonly
      $('#teamonlychat').append "<li>#{message.time}　#{message.user_id}: #{message.body}</li>"
    else
      $('#teamchat').append "<li>#{message.time}　#{message.user_id}: #{message.body}</li>"

$ ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)
