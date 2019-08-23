class PlaylistSong < ApplicationRecord
    belongs_to :playlist, :song
end