View = require 'views/base/view'

module.exports = class HomePageView extends View
  autoRender: yes
  className: 'home-page'
  template: require './templates/home'
