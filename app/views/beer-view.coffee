View = require 'views/base/view'

module.exports = class BeerView extends View
  template: require './templates/beer'
  className: 'panel panel-default beer'
  tagName: 'li'
  events:
    'click [data-toggle="collapse"]': '_clickCollapse'
    'click [data-name="brewery-name"]': '_submitSearch'
    'click [data-name="beer-style"]': '_submitSearch'

  initialize: ->
    @delegate 'show.bs.collapse', @_lazyLoadImages
  
  _clickCollapse: (evt) ->
    return unless evt.target
    @_toggleIcon evt
    @_trackAccordionClick evt

  _toggleIcon: (evt) ->
    return unless evt.target
    $icon = $(evt.target).find('i')
    if $icon.hasClass('glyphicon-plus-sign')
      $icon.removeClass('glyphicon-plus-sign').addClass('glyphicon-minus-sign')
    else
      $icon.removeClass('glyphicon-minus-sign').addClass('glyphicon-plus-sign')

  _trackAccordionClick: (evt) ->
    return unless evt.target
    label = $(evt.target).text().trim()
    value = $(evt.target).closest('a').attr('href')
    window.ga('send','event','link','click', label, value)

  _lazyLoadImages: (evt) ->
    $(evt.target).find('[data-original]').each ->
      imageSrc = $(@).attr("data-original")
      $(@).attr("src", imageSrc).removeAttr("data-original")

  _submitSearch: (evt) ->
    search = $(evt.target).attr('data-value')
    @publishEvent '!router:route', "/beer/#{encodeURIComponent(search)}"
