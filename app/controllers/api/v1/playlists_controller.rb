module Api
  module V1
    class PlaylistsController < ApplicationController
      def index
        @playlists = User.find(params[:arist_id])s
        render json: @playlists
      end

      def create
        @user = Playlist.find(params[:id])
        @user_playlist = @user.playlists.build(playlist_params)
        render json: @user_playlist
      end

      def show
        @playlist = Playlist.find(params[:id]) #only works if user id is in params
        if @user_playlist.save
          render json: @playlist, location: api_v1_playlist_url(@playlist)
        else
          render json: @playlist.errors, status: :unprocessable_entity
        end
      end

      private

      def playlist_params
        params.require(:playlist).permit(:name)
      end
    end
  end
end

