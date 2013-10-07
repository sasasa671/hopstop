View = require 'views/base/view'

module.exports = class HeaderView extends View
  className: 'header'
  region: 'header'
  id: 'header'
  template: require './templates/header'
  events:
    'submit form'   : '_submit'
    'keypress input': '_hide'
    'click button'  : '_validateInput'

  _submit: (evt) ->
    evt.preventDefault()
    input = evt.target[0].value
    return unless input
    window.ga('send','event','form','submit', 'search', input) # track event
    @publishEvent '!router:route', "/beer/#{window.encodeURIComponent(input)}"

  _hide: (evt) ->
    code = evt.keyCode || evt.which;
    if code is 13
      @$('.navbar-collapse').collapse('hide')

  _validateInput: (evt) ->
    $input = $(evt.target).closest('button').prev().find('input')
    return unless $input
    if $input.val()
      @_submit evt
    else
      $input.focus()