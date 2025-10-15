class HomeController < ApplicationController
  allow_unauthenticated_access only: [] 

  def index
    @total_users = User.count
    @total_bands = Band.count
    @total_albums = Album.count
    @total_genres = Genre.count
    @total_styles = Style.count

  end
  
end
