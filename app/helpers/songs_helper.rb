module SongsHelper
  def artist_select(song, artist_id)
    if !artist_id
      collection_select(:song, :artist_id, Artist.all, :id, :name)
    else
      hidden_field_tag('song[artist_id]', song.artist_id)
    end
  end
end
