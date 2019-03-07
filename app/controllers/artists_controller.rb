class ArtistsController < ApplicationController
  def create
    @artist = @list.artist.new(artist_params)
    if @artist.save
      redirect_to [@list, @artist]
    else
      render :new
    end
  end
  
  def index
    @artists = @list.artists
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
    render partial: 'form'
  end

  def new
    @artist = @list.artists.new
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to [@list, @artist]
    else
      render :new
    end
  end

  def destroy
    Artist.find(params[:id]).destroy
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
