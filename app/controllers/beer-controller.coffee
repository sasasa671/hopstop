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

  search: (attrs) ->
    @collection = new BeersCollection name: attrs.name # TODO: Refactor to use attrs.id? Or settle on use of idAttribute?
    @bcv = new BeersCollectionView {@collection}
    @bsv = new BeerSidebarView
    @collection.fetch
      success: =>
        @bcv.render()
    @bsv.render()

  show: (attrs) ->
    @model = new Beer id: attrs.id
    @view = new BeerPageView {@model}
    @model.fetch
      success: => @view.render()
