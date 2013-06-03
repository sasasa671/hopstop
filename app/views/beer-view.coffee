View = require 'views/base/view'
template = require 'views/templates/beer'

module.exports = class BeerView extends View
  template: template
  className: 'beer'

  render: ->
    super
    
    # Display lazy-loaded images when collapsible group clicked
    @$el.on('show', (event) ->
      $(event.target).find('img.lazy').each( () ->
        imageSrc = $(this).attr("data-original")
        $(this).attr("src", imageSrc).removeAttr("data-original")
      )
    )

    # Toggle the plus and minus icons on activation
    @$el.click( () ->
      $icon = $(this).find('i')
      if $icon.hasClass('icon-plus')
        $icon.removeClass('icon-plus').addClass('icon-minus')
      else
        $icon.removeClass('icon-minus').addClass('icon-plus')
    )