Rails.application.routes.draw do

  #stocks

  #blank form
  get '/stocks' => 'stocks#form'

  #form submits here, does lookup, prints results
  get '/stocks/lookup' => 'stocks#do_lookup'


  #Movies
  #blank form for movies
  get '/movies' => 'movies#form'

  #form submits here, does lookup, prints results
  get '/form/movie_lookup' => 'movies#do_lookup'

  #details page for a single result
  get '/movies/results/:id' => 'movies#movie_info'






end
