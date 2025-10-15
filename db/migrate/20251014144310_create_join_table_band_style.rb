class CreateJoinTableBandStyle < ActiveRecord::Migration[8.0]
  def change
    create_join_table :bands, :styles do |t|
      # t.index [:band_id, :style_id]
      # t.index [:style_id, :band_id]
    end
  end
end
