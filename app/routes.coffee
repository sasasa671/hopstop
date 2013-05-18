module.exports = (match) ->
  match '', 'beer#index'
  match 'beer', 'beer#index', name: 'beers'
  match 'beer/:name', 'beer#search', name: 'beerSearch'
  match 'beer/:id', 'beer#show', name: 'beer', constraints: {id: /^\d+$/}
