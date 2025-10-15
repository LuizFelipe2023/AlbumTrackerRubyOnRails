class CreateJoinTableAlbumsGenres < ActiveRecord::Migration[8.0]
  def change
    create_join_table :albums, :genres do |t|
      t.index [:album_id, :genre_id], unique: true   
      t.index [:genre_id, :album_id]                
      t.timestamps                                  
    end
  end
end
