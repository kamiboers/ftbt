class Api::V1::PlaylistsController < Api::V1::BaseController

def create
  session[:user_id] = params[:user]
  playlist = PlaylistManager.create_playlist(current_user, params[:intensity], params[:name])
  # result = PlaylistManager.populate_playlist(playlist.spotify_id, playlist.genre, playlist.intensity, playlist.user)
  # binding.pry
end

def show
  @playlist = Playlist.find_by(id: params[:id])
end

end