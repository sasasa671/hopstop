View = require 'views/base/view'
template = require 'views/templates/beer'

module.exports = class BeerView extends View
  template: template
  className: 'panel beer'

  render: ->
    super
    
    # Display lazy-loaded images when collapsible group clicked
    @$el.on('show.bs.collapse', (event) ->
      $(event.target).find('img.lazy').each( () ->
        imageSrc = $(this).attr("data-original")
        $(this).attr("src", imageSrc).removeAttr("data-original")
      )
    )

    # TODO: Integrate Font-Awesome or use Glyphicons
    # Toggle the plus and minus icons on activation
    # @$el.click ->
    #   $icon = $(this).find('i')
    #   if $icon.hasClass('icon-plus')
    #     $icon.removeClass('icon-plus').addClass('icon-minus')
    #   else
    #     $icon.removeClass('icon-minus').addClass('icon-plus')

    @