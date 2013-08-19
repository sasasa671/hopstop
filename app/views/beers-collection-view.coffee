CollectionView = require 'views/base/collection-view'
Beer = require 'views/beer-view'

module.exports = class BeersView extends CollectionView
  itemView: Beer
  className: 'panel-group beers'
  id: 'accordion'
  region: 'main'

  initialize: ->
    super
    page = if @collection?.name then "/beer/#{@collection.name}" else '/'
    window.ga('send','pageview', page)