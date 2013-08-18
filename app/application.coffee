Layout = require 'views/layout'

# The application object.
module.exports = class Application extends Chaplin.Application

  initLayout: (options = {}) ->
    options.title ?= @title
    @layout = new Layout options

  # Create additional mediator properties.
  initMediator: ->
    # Add additional application-specific properties and methods
    # e.g. Chaplin.mediator.prop = null
    Chaplin.mediator.user = null
    # Seal the mediator.
    super