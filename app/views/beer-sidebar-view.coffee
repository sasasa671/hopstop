View = require 'views/base/view'
SearchesView = require 'views/searches-view'

module.exports = class BeerSidebarView extends View
  template: require './templates/beer-sidebar'
  region: 'sidebar'

  attach: ->
    super
    container = '[data-name="searches"]'
    searchesView = new SearchesView {@collection, container}
    @subview 'searches', searchesView
    @$('[data-toggle="popover"]').popover
      trigger: 'hover'
      placement: 'left'
