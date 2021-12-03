require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'empty song not saved' do
    my_song = Song.new
    my_song.save

    refute my_song.valid?
  end

  test ' validsong is saved' do
    my_song = Song.new

    my_song.name = 'Valid Name for my_song'
    my_song.artist = 'This is my artist'

    my_song.save
    assert my_song.valid?
  end

  test 'should not save duplicates' do
    song1 = Song.new
    
    song1.name = 'My first name'
    song1.artist = 'This is my first artist'

    song1.save
    assert song1.valid?

    song2 = Song.new
    
    song2.name = 'My first name'
    song2.artist = 'This is my first artist'

    song2.save
    refute song2.valid?
  end

end
