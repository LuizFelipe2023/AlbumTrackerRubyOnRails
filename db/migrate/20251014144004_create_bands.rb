class CreateBands < ActiveRecord::Migration[8.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :country
      t.integer :formed_in
      t.references :genre, null: false, foreign_key: true
      t.timestamps
    end
  end
end
