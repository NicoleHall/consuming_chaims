class SongsController < ApplicationController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
  end

  def create
    @song = Song.create(params[:song])
    redirect_to song_path(@song.id)
  end

  def edit
    @song = Song.find(params[:id])
    redirect_to song_path(@song.id)
  end

  def destoy
    Song.destroy(params[:id])
  end
end
