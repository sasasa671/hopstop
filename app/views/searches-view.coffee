CollectionView = require 'views/base/collection-view'
SearchView = require 'views/search-view'

module.exports = class SearchesView extends CollectionView
  itemView: SearchView
  noWrap: on
  filterer: (item, index) ->
    if index < @collection.length - 5 then false else true
