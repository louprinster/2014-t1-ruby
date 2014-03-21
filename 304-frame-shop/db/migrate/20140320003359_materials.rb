class Materials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string  :name
      t.float   :base_price  
    end
  end
end
