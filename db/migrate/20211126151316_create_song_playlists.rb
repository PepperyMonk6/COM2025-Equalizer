class CreateSongPlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :song_playlists do |t|
      t.integer :playlist_id
      t.integer :song_id

      t.timestamps
    end
    add_index :song_playlists, :playlist_id
    add_index :song_playlists, :song_id
  end
end
