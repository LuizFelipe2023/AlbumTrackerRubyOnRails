class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end
