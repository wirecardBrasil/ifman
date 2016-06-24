# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#add-user-form").on "ajax:success", (e, data, status, xhr) ->
    $("#users-content").append "<tr><td>#{data.user}</td><td><a data-confirm='Are you sure?' class='btn btn-danger pull-right delete-user' data-remote='true' rel='nofollow' data-method='delete' href='/feature/#{data.feature}/user/#{data.user}'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a></td></tr>"
    $("#user").val ""

  $('#percentage').slider
  	formatter: (value) ->
  		return "Current value: #{value}"

  $("#percentage").on "slide", (event) ->
    $("#current-percentage").text event.value

  $(".delete-user").on "ajax:success", (e, data, status, xhr) ->
    $("##{data.user}").remove()