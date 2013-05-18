Controller = require 'controllers/base/controller'
Beer = require 'models/beer'
BeerPageView = require 'views/beer-view'
BeersCollection = require 'models/beers-collection'
BeersCollectionView = require 'views/beers-collection-view'

module.exports = class BeersController extends Controller
  historyURL: 'beer'

  index: ->
    @collection = new BeersCollection()
    @view = new BeersCollectionView {@collection}
    @collection.fetch
      success: => @view.render()

  search: (params) ->
    @collection = new BeersCollection name: params.name
    @view = new BeersCollectionView {@collection}
    @collection.fetch
      success: => @view.render()

  show: (params) ->
    @model = new Beer id: params.id
    @view = new BeerPageView {@model}
    @model.fetch
      success: => @view.render()
