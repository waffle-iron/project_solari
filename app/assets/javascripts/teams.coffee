# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @ChatClass
  constructor: (url, useWebsocket) ->
    @team_id = $('#team_id').text()
    @user_id = $('#user_id').text()
    # ソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channel = @dispatcher.subscribe(@team_id)
#    @bindEvents()

  # イベントを監視
  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('#send_teamchat').on 'click', @sendTeamMessage
    $('#send_teamonlychat').on 'click', @sendTeamOnlyMessage
    # サーバーからnew_messageを受け取ったらreceiveMessageを実行
#    @dispatcher.bind 'new_message', @receiveMessage
    @channel.bind 'new_message', @receiveMessage

  sendTeamMessage: (event) =>
    msg_body = $('#team_msgbody').val()
    if msg_body == ""
      return
    @dispatcher.trigger 'new_message', { user_id: @user_id, body: msg_body, team_id: @team_id, teamonly: false }
    $('#team_msgbody').val('')

  sendTeamOnlyMessage: (event) =>
    msg_body = $('#teamonly_msgbody').val()
    if msg_body == ""
      return
    @dispatcher.trigger 'new_message', { user_id: @user_id, body: msg_body, team_id: @team_id, teamonly: true }
    $('#teamonly_msgbody').val('')

  receiveMessage: (message) =>
    console.log message
    if message.teamonly
      $('#teamonlychat').append "<li>#{message.time}　#{message.user_id}: #{message.body}</li>"
    else
      $('#teamchat').append "<li>#{message.time}　#{message.user_id}: #{message.body}</li>"

  unsubscribe: () =>
    @channel = @dispatcher.unsubscribe(@team_id)

  subscribe: () =>
    @team_id = $('#team_id').text()
    @channel = @dispatcher.subscribe(@team_id)
    @bindEvents()

init = ->
  window.chatClass = new ChatClass($('#chat').data('uri'), true)

unsubscribe = ->
  window.chatClass.unsubscribe()

subscribe = ->
  window.chatClass.subscribe()

#$(document).ready(init)
#$(document).on("page:before-change", unsubscribe)
#$(document).on("page:change", subscribe)
