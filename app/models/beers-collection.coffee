Collection = require 'models/base/collection'
Beer = require 'models/beer'

module.exports = class Beers extends Collection
  model: Beer

  initialize: (params) ->
    @search = params.search if params

  url: ->
    if @search
      '/api/untappd/search/beer?sort=count&q=' + @search
    else
      '/api/untappd/search/beer?sort=count&q=founder'

  parse: (response, options) ->
    response.response.beers.items
