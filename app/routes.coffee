module.exports = (match) ->
  match 'beer/:search', 'beers#search', constraints: {search: /^.{2,}$/}
  match 'beer', 'beers#index'
  match '', 'home#index'
