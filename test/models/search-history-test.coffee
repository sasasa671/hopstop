SearchHistory = require 'models/search-history'

describe 'SearchHistory', ->
  beforeEach ->
    @collection = new SearchHistory()

  afterEach ->
    @collection.dispose()
