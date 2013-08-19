View = require 'views/base/view'
template = require 'views/templates/beer'

module.exports = class BeerView extends View
  template: template
  className: 'panel beer'
  events:
    'click [data-toggle="collapse"]': '_trackAccordionClick'

  render: ->
    super
    
    # Display lazy-loaded images when collapsible group clicked
    @$el.on('show.bs.collapse', (evt) ->
      $(evt.target).find('img.lazy').each( ->
        imageSrc = $(this).attr("data-original")
        $(this).attr("src", imageSrc).removeAttr("data-original")
      )
    )

    # TODO: Integrate Font-Awesome or use Glyphicons again
    # Toggle the plus and minus icons on activation
    # @$el.click ->
    #   $icon = $(this).find('i')
    #   if $icon.hasClass('icon-plus')
    #     $icon.removeClass('icon-plus').addClass('icon-minus')
    #   else
    #     $icon.removeClass('icon-minus').addClass('icon-plus')

    @

  _trackAccordionClick: (evt) ->
    return unless evt.target
    label = evt.target.textContent.trim()
    value = evt.target.parentNode.attributes['href'].value
    window.ga('send','event','link','click', label, value)
    