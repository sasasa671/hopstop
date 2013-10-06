View = require 'views/base/view'

module.exports = class BeerView extends View
  template: require './templates/beer'
  className: 'panel panel-default beer'
  tagName: 'li'
  events:
    'click [data-toggle="collapse"]': '_trackAccordionClick'
    'click [data-toggle="collapse"]': '_toggleIcon'

  initialize: ->
    @$el.on('show.bs.collapse', (evt) ->
      $(evt.target).find('img.lazy').each( ->
        imageSrc = $(this).attr("data-original")
        $(this).attr("src", imageSrc).removeAttr("data-original")
      )
    )
    @
    
  _trackAccordionClick: (evt) ->
    return unless evt.target
    label = $(evt.target).text().trim()
    value = $(evt.target).closest('a').attr('href')
    window.ga('send','event','link','click', label, value)
    
  _toggleIcon: (evt) ->
    return unless evt.target
    $icon = $(evt.target).find('i')
    if $icon.hasClass('glyphicon-plus-sign')
      $icon.removeClass('glyphicon-plus-sign').addClass('glyphicon-minus-sign')
    else
      $icon.removeClass('glyphicon-minus-sign').addClass('glyphicon-plus-sign')