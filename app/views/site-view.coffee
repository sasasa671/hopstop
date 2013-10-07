View = require 'views/base/view'

# Site view is a top-level view which is bound to body.
module.exports = class SiteView extends View
  container: 'body'
  id: 'site-container'
  regions:
    'header' : 'nav[role="navigation"]'
    'main'   : '#content'
    'sidebar': '#sidebar'
  template: require './templates/site'

  events:
    'click [data-toggle="offcanvas"]': '_toggleSidebar'

  _toggleSidebar: (evt) ->
    @$('.row-offcanvas').toggleClass('active');