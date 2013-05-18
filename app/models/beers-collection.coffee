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
      '/api/untappd/search/beer?sort=count&q=founders'

  # Pull the list of beers out of the response object
  parse: (response, options) ->
    response.response.beers.items