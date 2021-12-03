class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update destroy addSong]
  before_action :set_playlist, only: %i[ addSong ]


  def addSong
    song_playlist = SongPlaylist.create(song_id: @song.id, playlist_id: @playlist.id)
    if song_playlist.save
        flash[:notice] = 'song saved'
    else 
      flash[:alert] = song_playlist.errors
    end

    respond_to do |format|
        format.html { redirect_to songs_url}
    end
  end
  
  # GET /songs or /songs.json
  def index
    @playlists = Playlist.all
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs or /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song, notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1 or /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
      
    end

    def set_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name, :artist, :album, :song_id, :playlist_id)
    end
end
