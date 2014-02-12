class CreateWorldCities < ActiveRecord::Migration
  def change
    create_table :world_cities do |t|
      t.string :name
      t.string :country
      t.string :flag_filename
      t.string  :timezone
      t.integer :pop_in_millions
    end
  end
end
