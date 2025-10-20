class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show edit update destroy]

  def index
    @albums = Album.all
    
    if params[:band_id].present?
      @albums = @albums.where(band_id: params[:band_id])
    end
    
    if params[:genre_id].present?
      @albums = @albums.where(genre_id: params[:genre_id])
    end
    

    if params[:style_ids].present?
      @albums = @albums.joins(:styles).where(styles: { id: params[:style_ids] }).distinct
    end
    
  
    @albums = @albums.order(:release_year).page(params[:page]).per(10)
    
    @bands = Band.order(:name)
    @genres = Genre.order(:name)
    @styles = Style.order(:name)
  end

  def show
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album, notice: "Album created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Album updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path, notice: "Album deleted successfully."
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(
      :title, :release_year, :tracklist, :cover,
      band_ids: [], genre_ids: [], style_ids: []
    )
  end

end
