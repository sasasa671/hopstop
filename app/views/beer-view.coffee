View = require 'views/base/view'

module.exports = class BeerView extends View
  template: require './templates/beer'
  className: 'panel panel-default beer'
  tagName: 'li'
  events:
    'click [data-toggle="collapse"]': '_clickCollapse'
    'click [data-name="brewery-name"]': '_submitSearch'
    'click [data-name="beer-style"]': '_submitSearch'
  listen:
    'toggleOpen': 'toggleOpen'

  initialize: ->
    @delegate 'show.bs.collapse', @_lazyLoadImages

  toggleOpen: ->
    @_toggleIcon()
    @_lazyLoadImages() unless @loaded
    @$el.find("[data-name=#{@model.get('beer')?.bid}]")?.collapse 'show'
    $('html,body').animate
      scrollTop: @$el.offset().top - 58 # FIXME: Calculate header height
    , 1000

  _clickCollapse: (evt) ->
    return unless evt.target
    @_toggleIcon()
    @_trackAccordionClick evt
    window.location = "##{@model.get('beer')?.bid}"

  _toggleIcon: ->
    $icon = @$('i')
    if $icon.hasClass('glyphicon-plus-sign')
      $icon.removeClass('glyphicon-plus-sign').addClass('glyphicon-minus-sign')
    else
      $icon.removeClass('glyphicon-minus-sign').addClass('glyphicon-plus-sign')

  _trackAccordionClick: (evt) ->
    return unless evt.target
    label = $(evt.target).text().trim()
    value = $(evt.target).closest('a').attr('href')
    window.ga 'send','event','link','click', label, value

  _lazyLoadImages: ->
    return if @loaded
    @$('[data-original]').each ->
      imageSrc = $(@).attr("data-original")
      $(@).attr("src", imageSrc).removeAttr("data-original")
    @loaded = true

  _submitSearch: (evt) ->
    search = $(evt.target).attr('data-value')
    @publishEvent '!router:route', "/beer/#{encodeURIComponent(search)}"
