class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
    end
  end
end
