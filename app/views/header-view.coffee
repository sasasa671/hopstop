View = require 'views/base/view'
template = require 'views/templates/header'

module.exports = class HeaderView extends View
  className: 'header'
  region: 'header'
  id: 'header'
  template: template
  events:
    # Listen for form submission event
    'submit form': 'submit'

  # Handles form submission event
  submit: (evt) ->
    evt.preventDefault()
    @publishEvent '!router:route', '/beer/' +
        window.encodeURIComponent(evt.target[0].value)