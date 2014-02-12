class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.string :incident
      t.string :description
    end
  end
end
