View = require 'views/base/view'

module.exports = class SpinnerView extends View
  autoRender: true
  containerMethod: 'html'
  template: require './templates/spinner'

  initialize: (options) ->
    super
    @previous = options.container.html()

  dispose: ->
    $(@container).html @previous
    delete @previous
    super