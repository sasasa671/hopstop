Beer = require 'models/beer'
Beers = require 'models/beers'

describe 'Beer', ->
  beforeEach ->
    @model = new Beer()
    @collection = new Beers()

  afterEach ->
    @model.dispose()
    @collection.dispose()
