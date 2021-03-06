json.array! @movies do |movie|
  json.movie movie
  
  json.user_inf do
  	if current_user != nil
	  	user_movie = current_user.user_movies.where(movie_id: movie["id"]).first
	  	if user_movie != nil
	      json.isSeen user_movie.is_seen
	      json.isFav true
        else
          json.isSeen false
	      json.isFav false
		end
	else
      json.isSeen false
      json.isFav false
	end
  end
end