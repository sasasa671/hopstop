View = require 'views/base/view'
SearchHistory = require 'models/search-history'

module.exports = class BeersSidebarView extends View
  template: require './templates/beer-sidebar'
  region: 'sidebar'

  initialize: ->
    @_populateRecentSearches()

  attach: ->
    super
    @$('[data-toggle="popover"]').popover
      trigger: 'hover'
      placement: 'left'

  _populateRecentSearches: ->
    @searchHistory ||= new SearchHistory
    @searchHistory.fetch()
    # for entry in @searchHistory.models
    #   console.log entry
