module.exports = (match) ->
  # match 'beer/:id', 'beer#show', name: 'beer', constraints: {id: /^\d+$/}
  match 'beer/:search', 'beer#search'
  match 'beer', 'beer#index'
  match '', 'beer#index'
