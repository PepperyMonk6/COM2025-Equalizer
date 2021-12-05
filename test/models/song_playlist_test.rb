require 'test_helper'

class SongPlaylistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @playlist = playlists(:one)
    @song = songs(:one)
  end

  test "should not save non empty song playlist" do
    songplaylist = SongPlaylist.new
    songplaylist.save

    refute songplaylist.valid?
  end


  test "should save non empty song playlist object" do
    songplaylist = SongPlaylist.new
    songplaylist.playlist_id = @playlist.id
    songplaylist.song_id = @song.id
    songplaylist.save

    assert songplaylist.valid?
  end
end
