class CreateJoinTableAlbumsBands < ActiveRecord::Migration[8.0]
  def change
    create_join_table :albums, :bands do |t|
      t.index [:album_id, :band_id], unique: true   
      t.index [:band_id, :album_id]                 
      t.timestamps                                  
    end
  end
end
