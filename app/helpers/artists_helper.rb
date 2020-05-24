module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, route)
    #Display a drop-down list of artists if someone edits directly via '/songs/:id/edit' --> edit_song_path

    #Only display the artist's name if they are editing through nested routing: '/artists/:artist_id/songs/:id/edit' --> artist_song_edit_path
    #HINT: You'll need to set a variable in the songs#edit controller action to pass to the helper method as an argument along with a song instance

    # if route is '/songs/:id/edit'
    #   display drop-down list of artists
    # elsif route is '/artists/:artist_id/songs/:id/edit'
    #   just display the artist_name of the @song
    # end
    if route == "edit_artist_song_path"
      label_tag song.artist.name
      hidden_field_tag "song[artist_id]", song.artist_id
    elsif route == "edit_song_path"
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    end
  end
end
