class SongsController < ApplicationController
  def create
    @song = @list.songs.new(song_params)
    if @song.save
      redirect_to [@list, @song]
    else
      render :new
    end
  end
  
  def index
    @songs = @list.songs
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
    render partial: 'form'
  end

  def new
    @song = @list.songs.new
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to [@list, @song]
    else
      render :new
    end
  end

  def destroy
    Song.find(params[:id]).destroy
  end

  private

  def song_params
    params.require(:song).permit(:name)
  end
end
