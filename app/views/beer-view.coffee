View = require 'views/base/view'
template = require 'views/templates/beer'

module.exports = class BeerView extends View
  template: template

  render: ->
    super
    
    # Display lazy-loaded images when collapsible group shown
    @$el.on('shown', (event) ->
      $(event.target).find('img.lazy').each( () ->
        imageSrc = $(this).attr("data-original")
        $(this).attr("src", imageSrc).removeAttr("data-original")
      )
    )