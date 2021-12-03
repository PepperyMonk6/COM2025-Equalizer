class Playlist < ApplicationRecord

    has_many :song_playlist, class_name: 'SongPlaylist'

end
