
class FavoritesController < ApplicationController
    
  before_action :require_authentication 

  def index
    @favorite_albums = Current.user.favorited_albums.order(:title)
    @favorite_bands = Current.user.favorited_bands.order(:name)
  end

  def favorite_band
    @band = Band.find(params[:band_id])
    Current.user.favorite_bands.create(band: @band)
    redirect_back fallback_location: bands_path, notice: "Banda adicionada aos favoritos!"
  rescue ActiveRecord::RecordNotUnique
    redirect_back fallback_location: bands_path, alert: "Banda já está nos favoritos!"
  end

  def unfavorite_band
    @band = Band.find(params[:band_id])
    Current.user.favorite_bands.find_by(band: @band)&.destroy
    redirect_back fallback_location: bands_path, notice: "Banda removida dos favoritos!"
  end

  def favorite_album
    @album = Album.find(params[:album_id])
    Current.user.favorite_albums.create(album: @album)
    redirect_back fallback_location: albums_path, notice: "Álbum adicionado aos favoritos!"
  rescue ActiveRecord::RecordNotUnique
    redirect_back fallback_location: albums_path, alert: "Álbum já está nos favoritos!"
  end

  def unfavorite_album
    @album = Album.find(params[:album_id])
    Current.user.favorite_albums.find_by(album: @album)&.destroy
    redirect_back fallback_location: albums_path, notice: "Álbum removida dos favoritos!"
  end
end