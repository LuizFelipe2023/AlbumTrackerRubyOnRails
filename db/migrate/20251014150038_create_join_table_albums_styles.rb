class CreateJoinTableAlbumsStyles < ActiveRecord::Migration[8.0]
  def change
    create_join_table :albums, :styles do |t|
      t.index [:album_id, :style_id], unique: true   
      t.index [:style_id, :album_id]                
      t.timestamps                                  
    end
  end
end
