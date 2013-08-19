CollectionView = require 'views/base/collection-view'
Beer = require 'views/beer-view'

module.exports = class BeersView extends CollectionView
  itemView: Beer
  className: 'panel-group beers'
  id: 'accordion'
  region: 'main'

  initialize: ->
    super
    page = this.collection.name
    window.ga('send','pageview', "/beer/#{page}")