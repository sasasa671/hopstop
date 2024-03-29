CollectionView = require 'views/base/collection-view'
BeerView = require 'views/beer-view'

module.exports = class BeersView extends CollectionView
  itemView: BeerView
  className: 'panel-group beers'
  region: 'main'
  tagName: 'ol'
  id: 'accordion'
  # fallbackSelector: '[data-name="empty-collection"]'
  listen:
    'sync collection': '_checkHash'

  initialize: ->
    super
    @_trackPageView()
    @_setCurrentSearch()

  _trackPageView: ->
    page = if @collection?.search then "/beer/#{@collection.search}" else '/'
    window.ga('send','pageview', page) if page

  _checkHash: ->
    target = window.location.hash?.slice(1)
    return unless target
    views = _.values @getItemViews()
    view.toggleOpen() for view in views when view.model.get('beer')?.bid.toString() == target

  _setCurrentSearch: ->
    $('[data-name="current-search"]').text if @collection.search then window.decodeURIComponent(@collection.search) else 'Founders'
