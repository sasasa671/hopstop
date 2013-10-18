Collection = require 'models/base/collection'
Beer = require 'models/beer'

module.exports = class Beers extends Collection
  model: Beer

  initialize: (params) ->
    @name = params.name if params

  url: ->
    if @name
      '/api/untappd/search/beer?sort=count&q=' + @name
    else
      '/api/untappd/search/beer?sort=count&q=founder'

  parse: (response, options) ->
    response.response.beers.items
