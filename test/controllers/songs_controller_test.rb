require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @playlist = playlists(:three)
    @song = songs(:one)
  end

  test "should add song to Playlist" do
    assert_difference('SongPlaylist.count') do
      post addSongToPlaylist_url(@playlist.id, @song.id)
    end

    assert_redirected_to songs_url
  end

  test "should get index" do
    get songs_url
    assert_response :success

    assert_select 'h1', 'Your songs'
  end

  test "should get new" do
    get new_song_url
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post songs_url, params: { song: { album: @song.album, artist: @song.artist, name: @song.name + "_testing"} }
    end

    assert_redirected_to song_url(Song.last)
  end

  test "should show song" do
    get song_url(@song)
    assert_response :success
  end

  test "should get edit" do
    get edit_song_url(@song)
    assert_response :success
  end

  test "should update song" do
    patch song_url(@song), params: { song: { album: @song.album, artist: @song.artist, name: @song.name + '3' } }
    assert_redirected_to song_url(@song)
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete song_url(@song)
    end

    assert_redirected_to songs_url
  end
end
