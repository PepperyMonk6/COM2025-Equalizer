json.extract! song, :id, :name, :artist, :album, :created_at, :updated_at
json.url song_url(song, format: :json)
