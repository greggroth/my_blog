# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->
  updatePreview()
  $('#post_tags_tokens').tokenInput('/tags.json', { 
    crossDomain: false, 
    theme: 'facebook'
    })
  $('.help-inline').addClass("label label-important")

# Updates the post-preview div if the post-body is present
updatePreview = ->
  if $('#post-body').is('*')
    setTimeout(updatePreview, 500)
    converter = new Markdown.Converter()
    $('#post-preview').html(converter.makeHtml($('#post-body').val()))  