class CreateRaceNames < ActiveRecord::Migration
  def change
    create_table :race_names do |t|
      t.string :name
    end
  end
end
