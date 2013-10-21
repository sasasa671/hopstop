View = require 'views/base/view'
SearchHistory = require 'models/search-history'

module.exports = class HeaderView extends View
  className: 'header'
  region: 'header'
  id: 'header'
  template: require './templates/header'
  events:
    'submit form'   : '_submit'
    'click button'  : '_validateAndSubmit'

  initialize: ->
    # TODO: Prefill search field for deep linked searches
    @searchHistory = new SearchHistory
    @searchHistory.fetch()

  _submit: (evt) ->
    evt.preventDefault()
    if $( document.querySelectorAll('.navbar-toggle') ).filter(':visible').length > 0
      @$('.navbar-collapse').collapse('hide')
    search = $(evt.target).prev().find('input').val()
    return unless search
    @_trackSearch search
    @_updateSearchHistory search
    @_redirectToSearch search

  _validateAndSubmit: (evt) ->
    $input = $(evt.target).closest('button').prev().find('input')
    return unless $input
    if $input.val()
      @_submit evt
    else
      $input.addClass 'has-error'
      $input.focus()

  _trackSearch: (search) ->
    window.ga 'send', 'event', 'form', 'submit', 'search', search

  _updateSearchHistory: (search) ->
    return unless search && @searchHistory
    @searchHistory.create {search}

  _redirectToSearch: (search) ->
    search = window.encodeURIComponent search
    Chaplin.helpers.redirectTo 'beer#search', {search}
