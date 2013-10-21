View = require 'views/base/view'

module.exports = class SearchView extends View
  template: require './templates/search'
  tagName: 'li'
  