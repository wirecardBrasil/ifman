# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".delete-feature").on "ajax:success", (e, data, status, xhr) ->
  console.log "e =============> #{e}"
  console.log "data ==========> #{data}"
  console.log "status ========> #{status}"
  console.log "xhr ===========> #{xhr}"
