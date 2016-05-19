# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class @MatchingClass
  constructor: (url, useWebsocket) ->
    @team_id = $('#matching_id').text()
    @user_id = $('#user_id').text()
    # ソケットのディスパッチャー
    @dispatcher = new WebSocketRails(url, useWebsocket)
    @channel = @dispatcher.subscribe(@matching_id)

  # イベントを監視
  bindEvents: () =>
    # 送信ボタンが押されたらサーバへメッセージを送信
    $('#send_rolechange').on 'click', @sendRoleChange
    @channel.bind 'role_changed', @changeRole

  sendRoleChange: (event) =>
    role_primary = $('#hogehoge').val()
    role_secondary = $('#hogehoge').val()
    @dispatcher.trigger 'role_changed', { user_id: @user_id, role_primary: role_primary, role_secondary: role_secondary, matching_id: @matching_id }

  unsubscribe: () =>
    @channel = @dispatcher.unsubscribe(@matching_id)

  subscribe: () =>
    @team_id = $('#matching_id').text()
    @channel = @dispatcher.subscribe(@matching_id)
    @bindEvents()

init = ->
  window.matchingClass = new MatchingClass($('#matching').data('uri'), true)

unsubscribe = ->
  window.matchingClass.unsubscribe()

subscribe = ->
  window.matchingClass.subscribe()

$(document).ready(init)
$(document).on("page:before-change", unsubscribe)
$(document).on("page:change", subscribe)
