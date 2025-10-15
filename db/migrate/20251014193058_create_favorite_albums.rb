class CreateFavoriteAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_albums do |t|
      t.references :user, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorite_albums, [:user_id, :album_id], unique: true
  end
end
