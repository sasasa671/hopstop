View = require 'views/base/view'

module.exports = class HeaderView extends View
  className: 'header'
  region: 'header'
  id: 'header'
  template: require './templates/header'
  events:
    'submit form'   : '_submit'
    'click button'  : '_validateInput'

  _submit: (evt) ->
    evt.preventDefault()
    @$('.navbar-collapse').collapse('hide')
    search = $(evt.target).prev().find('input').val()
    return unless search
    window.ga('send','event','form','submit', 'search', search) # track event
    @publishEvent '!router:route', "/beer/#{window.encodeURIComponent(search)}"

  _validateInput: (evt) ->
    $input = $(evt.target).closest('button').prev().find('input')
    return unless $input
    if $input.val()
      @_submit evt
    else
      $input.focus()