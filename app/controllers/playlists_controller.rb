class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy removeSong ]
  before_action :set_song, only: [ :removeSong ]

  # GET /playlists or /playlists.json
  def index
    @playlists = Playlist.all
  end

  def removeSong
    SongPlaylist.where(playlist_id: @playlist.id, song_id: @song.id).destroy_all
    respond_to do |format|
      format.html {redirect_to @playlist}
    end
  end

  # GET /playlists/1 or /playlists/1.json
  def show
    songIds = SongPlaylist.where(playlist_id: @playlist.id).pluck(:song_id)
    @songs = Song.where(id: songIds).all
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: "Playlist was successfully created." }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: "Playlist was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def set_song
      @song = Song.find(params[:song_id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name)
    end
end
