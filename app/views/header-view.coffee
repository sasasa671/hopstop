View = require 'views/base/view'
template = require 'views/templates/header'

module.exports = class HeaderView extends View
  className: 'header'
  region: 'header'
  id: 'header'
  template: template
  events:
    # Listen for form submission event
    'submit form': '_doSubmit'

  # Handles form submission event
  _doSubmit: (evt) ->
    evt.preventDefault()
    input = evt.target[0].value
    return unless input
    window.ga('send','event','form','submit', 'search', input) # track event
    param = window.encodeURIComponent(input)
    @publishEvent '!router:route', "/beer/#{param}?q=#{param}"