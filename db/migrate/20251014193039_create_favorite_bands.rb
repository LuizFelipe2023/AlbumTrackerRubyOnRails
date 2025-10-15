class CreateFavoriteBands < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_bands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :band, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorite_bands, [:user_id, :band_id], unique: true
  end
end
