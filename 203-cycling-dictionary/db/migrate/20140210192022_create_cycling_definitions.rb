class CreateCyclingDefinitions < ActiveRecord::Migration
  def change
    create_table :cycling_definitions do |t|
      t.string :word
      t.string :definition
      t.string :part_of_speech
    end
  end
end
