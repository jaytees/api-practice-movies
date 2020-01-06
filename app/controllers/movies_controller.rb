
class MoviesController < ApplicationController

  def form

    #movie genre search

        genre_url = "https://api.themoviedb.org/3/genre/movie/list?api_key=24d863d54c86392e6e1df55b9a328755"

        genres_response = HTTParty.get genre_url

        @genres = genres_response['genres']


  end




  def do_lookup

# if params[:genre_id] == ""

  #movie name lookup
    @query = params[:movie_name]
    # unless params[:movie_name].blank?

    url = "https://api.themoviedb.org/3/search/movie?api_key=24d863d54c86392e6e1df55b9a328755&query=#{@query}"


    response = HTTParty.get url

    @results = response['results']


# else

  #movie genre lookup
    @genre_query = params[:genre_id]
    # unless params[:genre_id].blank?

    genre_url = "https://api.themoviedb.org/3/discover/movie?api_key=24d863d54c86392e6e1df55b9a328755&with_genres=#{@genre_query}"

    genre_response = HTTParty.get genre_url



    @genre_results = genre_response['results']
    #
    # binding.pry
    #
    #
    # if params[:genre_id].blank?
    #   puts 'Movie search'
    # else
    #   puts 'Genre search'
    # end

    # binding.pry

# end

  end



  def movie_info

  #individual results
    movie_id = params[:id]
    #make HTTParty request to different url which accepts movie id as part of the ID

    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=24d863d54c86392e6e1df55b9a328755"

    response = HTTParty.get url

    @result = response


  #related titles
    related_url = "https://api.themoviedb.org/3/movie/#{movie_id}/similar?api_key=24d863d54c86392e6e1df55b9a328755&language=en-US&page=1"

    related_response = HTTParty.get related_url

    @related_titles = related_response['results']

    # binding.pry

  end



end
