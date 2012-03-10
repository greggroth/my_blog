# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->
  updatePreview()

# Updates the post-preview div if the post-body is present
updatePreview = ->
  if $('#post-body').html()
    setTimeout(updatePreview, 500)
    converter = new Markdown.Converter()
    $('#post-preview').html(converter.makeHtml($('#post-body').val()))