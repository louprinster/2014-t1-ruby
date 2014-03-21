class FrameOrders < ActiveRecord::Migration
  def change
    create_table :frame_orders do |t|
      t.integer :material_id
      t.integer :linear_inches
      t.boolean :include_hanging_hardware
      t.float   :total_price
      t.timestamps
    end
  end
end
