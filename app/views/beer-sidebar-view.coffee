View = require 'views/base/view'
template = require 'views/templates/beer-sidebar'

module.exports = class BeersSidebarView extends View
  template: template
  region: 'sidebar'
