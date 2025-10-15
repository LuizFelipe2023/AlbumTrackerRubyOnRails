class ChangeTracklistToJsonInAlbums < ActiveRecord::Migration[8.0]
  def change
    change_column :albums, :tracklist, :json
  end
end
