require 'test_helper'

class PlaylistsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @playlist = playlists(:one)
    @song = songs(:one)

    song_playlist = SongPlaylist.new
    song_playlist.playlist_id = @playlist.id
    song_playlist.song_id = @song.id
    song_playlist.save

  end

  test "should remove song from playlist" do
    assert_difference('SongPlaylist.count', -1) do
      delete removeSong_url(@playlist.id, @song.id)
    end

    assert_redirected_to playlist_url(@playlist)
  end

  test "should get index" do
    get playlists_url
    assert_response :success

    assert_select 'h1', 'Listing playlists'
  end

  test "should get new" do
    get new_playlist_url
    assert_response :success
  end

  test "should create playlist" do
    assert_difference('Playlist.count') do
      post playlists_url, params: { playlist: { name: @playlist.name + '3'} }
    end

    assert_redirected_to playlist_url(Playlist.last)
  end

  test "should show playlist" do
    get playlist_url(@playlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_playlist_url(@playlist)
    assert_response :success
  end

  test "should update playlist" do
    patch playlist_url(@playlist), params: { playlist: { name: @playlist.name } }
    assert_redirected_to playlist_url(@playlist)
  end

  test "should destroy playlist" do
    assert_difference('Playlist.count', -1) do
      delete playlist_url(@playlist)
    end

    assert_redirected_to playlists_url
  end
end
