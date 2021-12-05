require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Should not create empty song" do
    song = Song.new
    song.save

    refute song.valid?
  end

  test "Should save non epmty song" do
    song = Song.new
    song.name = 'Song'
    song.album = 'Album'
    song.artist = 'artist'
    song.save

    assert song.valid?
  end

  test "should not save songs with duplicate names" do
    song1 = Song.new
    song1.name = 'Song'
    song1.album = 'Album'
    song1.artist = 'artist'
    song1.save

    assert song1.valid?


    song2 = Song.new
    song2.name = 'Song'
    song2.album = 'Album2'
    song2.artist = 'artist2'
    song2.save

    refute song2.valid?
  end
end
