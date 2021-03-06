# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->
  if $('#post-body').is('*')
    window.setInterval ->
      updatePreview()
    , 3000
  $('#post_tags_tokens').tokenInput('/tags.json', { 
    crossDomain: false, 
    theme: 'facebook'
    })
  $('.help-inline').addClass("label label-important")

# Updates the post-preview div if the post-body is present
updatePreview = ->
  code_pattern = /\{\%\scode\s(.+)\s\%\}([^\{]*)\s+\{\%\sendcode\s\%\}/
  converter = new Markdown.Converter()
  converted_text = converter.makeHtml($('textarea#post-body').val())
  if converted_text.match(code_pattern)?
    unformatted_code = converted_text.match(code_pattern)[2]
    language = converted_text.match(code_pattern)[1]
    $.getJSON( '/posts/1/markdown_code.json',
      data: { code: unformatted_code, language: language },
      (formatted_code) -> 
        $('#post-preview').html(converted_text.replace(code_pattern, formatted_code))
      )
  else
    $('#post-preview').html(converted_text)