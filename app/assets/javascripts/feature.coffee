# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#add-user-form").on "ajax:success", (e, data, status, xhr) ->
    $("#users-content").append "<tr><td>#{data.user}</td></tr>"
    $("#user").val ""

  $('#percentage').slider
  	formatter: (value) ->
  		return "Current value: #{value}"

  $("#percentage").on "slide", (event) ->
    $("#current-percentage").text event.value
