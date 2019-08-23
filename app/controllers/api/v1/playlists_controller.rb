module Api
  module V1
    class PlaylistsController < ApplicationController
      def index
        @playlists = Playlist.all
        render json: @playlists
      end

      def create
        @user = Playlist.find(params[:id])
        @user_playlist = @user.playlists.build()
        render json: @user_playlist
      end

      def show
        @playlist = Playlist.find(params[:id]) #only works if user id is in params
        render json: @playlist
      end

      private

      def playlist_params
        params.require(:id)
      end
    end
  end
end

