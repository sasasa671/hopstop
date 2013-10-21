Controller = require 'controllers/base/controller'
Beers = require 'models/beers'
Beer = require 'models/beer'
SearchHistory = require 'models/search-history'
BeerPageView = require 'views/beer-view'
BeersView = require 'views/beers-view'
BeerSidebarView = require 'views/beer-sidebar-view'

module.exports = class BeersController extends Controller
  historyURL: 'beer'

  index: ->
    @collection = new Beers
    @bcv = new BeersView {@collection}
    @history = new SearchHistory
    @bsv = new BeerSidebarView collection: @history
    @collection.fetch
      success: =>
        @bcv.render()
    @history.fetch
      success: =>
        @bsv.render()

  search: (attrs) ->
    @collection = new Beers search: attrs.search
    @bcv = new BeersView {@collection}
    @history = new SearchHistory
    @bsv = new BeerSidebarView collection: @history
    @collection.fetch
      success: =>
        @bcv.render()
    @history.fetch
      success: =>
        @bsv.render()

  show: (attrs) ->
    @model = new Beer id: attrs.id
    @view = new BeerPageView {@model}
    @model.fetch
      success: => @view.render()
