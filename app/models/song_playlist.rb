class SongPlaylist < ApplicationRecord

    belongs_to :song
    belongs_to :playlist

    validates_presence_of :song_id, :playlist_id
end
