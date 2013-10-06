View = require 'views/base/view'

module.exports = class HeaderView extends View
  className: 'header'
  region: 'header'
  id: 'header'
  template: require './templates/header'
  events:
    'submit form': '_submit'
    'keypress input': '_hide'

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