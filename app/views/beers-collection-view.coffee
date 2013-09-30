CollectionView = require 'views/base/collection-view'
BeerView = require 'views/beer-view'

module.exports = class BeersView extends CollectionView
  itemView: BeerView
  className: 'panel-group beers'
  region: 'main'

  initialize: ->
    super
    page = if @collection?.name then "/beer/#{@collection.name}" else '/'
    window.ga('send','pageview', page)