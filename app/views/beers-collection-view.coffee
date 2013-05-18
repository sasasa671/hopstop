CollectionView = require 'views/base/collection-view'
Beer = require 'views/beer-view'

module.exports = class BeersView extends CollectionView
  itemView: Beer
  className: 'accordion'
  id: 'accordion'
  region: 'main'