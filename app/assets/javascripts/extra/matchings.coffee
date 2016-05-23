# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @MatchingClass
  constructor: (url, useWebsocket) ->
    @matching_id = $('#matching_id').text()
    @token = $('#token').text()
    # ソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channel = @dispatcher.subscribe("matching" + @matching_id)

  # イベントを監視
  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('#send_rolechange').on 'click', @sendRoleChange
    @channel.bind 'role_changed', @changeRole

  sendRoleChange: (event) =>
    top = $('#matching_queue_top').is(':checked')
    mid = $('#matching_queue_mid').is(':checked')
    bot = $('#matching_queue_bot').is(':checked')
    sup = $('#matching_queue_sup').is(':checked')
    jg = $('#matching_queue_jg').is(':checked')

    @dispatcher.trigger 'role_changed', { token: @token, id: @matching_id, top: top, mid: mid, bot: bot, sup: sup, jg: jg }

  changeRole: (message) =>
    console.log message
    $('#summoner_name' + message.member_id).text(message.summoner_name)
    $('#top' + message.member_id).text(message.top)
    $('#mid' + message.member_id).text(message.mid)
    $('#bot' + message.member_id).text(message.bot)
    $('#sup' + message.member_id).text(message.sup)
    $('#jg' + message.member_id).text(message.jg)

  unsubscribe: () =>
    console.log "unsubscribe"
    @dispatcher.trigger 'exit_room', { token: @token, id: @matching_id }
    @channel = @dispatcher.unsubscribe("matching" + @matching_id)

  subscribe: () =>
    @team_id = $('#matching_id').text()
    @channel = @dispatcher.subscribe("matching" + @matching_id)
    @bindEvents()

init = ->
  window.matchingClass = new MatchingClass($('#matching').data('uri'), true)

unsubscribe = ->
  window.matchingClass.unsubscribe()

subscribe = ->
  window.matchingClass.subscribe()

$(document).ready(init)
$(document).on("page:before-unload", unsubscribe)
$(document).on("page:change", subscribe)
