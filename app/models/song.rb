class Song < ApplicationRecord

    has_many :song_playlist, class_name: 'SongPlaylist'
    
    validates :name, presence: true
    validates :name, uniqueness: true

end
