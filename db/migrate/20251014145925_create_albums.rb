class CreateAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :release_year
      t.text :tracklist

      t.timestamps
    end
  end
end
