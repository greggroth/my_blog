# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->
  updatePreview()
  
updatePreview = ->
  setTimeout(updatePreview, 3000)
  converter = new Markdown.Converter()
  $('#post-preview').html(converter.makeHtml($('#post-body').val()))
  console.log($('#post-body').text())