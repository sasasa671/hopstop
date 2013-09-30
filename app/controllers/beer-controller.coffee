Controller = require 'controllers/base/controller'
Beer = require 'models/beer'
BeerPageView = require 'views/beer-view'
BeersCollection = require 'models/beers-collection'
BeersCollectionView = require 'views/beers-collection-view'
BeerSidebarView = require 'views/beer-sidebar-view'

module.exports = class BeersController extends Controller
  historyURL: 'beer'

  index: ->
    @collection = new BeersCollection
    @bcv = new BeersCollectionView {@collection}
    @bsv = new BeerSidebarView
    @collection.fetch
      success: =>
        @bcv.render()
        @bsv.render()

  search: (params) ->
    @collection = new BeersCollection name: params.name # TODO: Refactor to use params.id?
    @bcv = new BeersCollectionView {@collection}
    @bsv = new BeerSidebarView
    @collection.fetch
      success: =>
        @bcv.render()
        @bsv.render()

  show: (params) ->
    @model = new Beer id: params.id
    @view = new BeerPageView {@model}
    @model.fetch
      success: => @view.render()
