Collection = require 'models/base/collection'
HistoryEntry = require 'models/history-entry'

module.exports = class SearchHistory extends Collection
  model: HistoryEntry
  localStorage: new Backbone.LocalStorage 'hopstop_search-history'
