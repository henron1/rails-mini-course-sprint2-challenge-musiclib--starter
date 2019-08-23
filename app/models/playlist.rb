class Playlist < ApplicationRecord
    has_many :playlist_songs
    has_many :songs through :playlist_song

    validates :names, presence: true
end