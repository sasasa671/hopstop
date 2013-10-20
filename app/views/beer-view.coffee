View = require 'views/base/view'

module.exports = class BeerView extends View
  template: require './templates/beer'
  className: 'panel panel-default beer'
  tagName: 'li'
  events:
    'click [data-toggle="collapse"]': '_clickCollapse'
    'click [data-name="brewery-name"]': '_searchBeer'
    'click [data-name="beer-style"]': '_searchBeer'
  listen:
    'toggleOpen': 'toggleOpen'

  initialize: ->
    @collapsed = true
    @delegate 'show.bs.collapse', @_lazyLoadImages

  toggleOpen: ->
    @collapsed = false
    @_lazyLoadImages() unless @loaded
    @$el.find("[data-name=#{@model.get('beer')?.bid}]")?.collapse 'show'
    $('html,body').animate
      scrollTop: @$el.offset().top - 58 # FIXME: Calculate header height
    , 1000
    @_toggleIcon()

  _clickCollapse: (evt) ->
    return unless evt.target
    @collapsed = !@collapsed
    @_toggleIcon()
    @_trackAccordionClick evt
    @publishEvent 'router:changeURL', "##{@model.get('beer')?.bid}"

  _toggleIcon: ->
    $icon = @$('i')
    switch @collapsed
      when true then $icon.removeClass('glyphicon-minus-sign').addClass('glyphicon-plus-sign')
      when false  then $icon.removeClass('glyphicon-plus-sign').addClass('glyphicon-minus-sign')

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

  _searchBeer: (evt) ->
    evt.preventDefault()
    search = window.encodeURIComponent( $(evt.target).text() )
    Chaplin.helpers.redirectTo 'beer#search', {search}
