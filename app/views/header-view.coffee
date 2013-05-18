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
  submit: (event) ->
    event.preventDefault()
    @publishEvent '!router:route', '/beer/' +
        window.encodeURIComponent(event.target[0].value)