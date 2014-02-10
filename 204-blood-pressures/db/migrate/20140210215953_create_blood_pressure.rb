class CreateBloodPressure < ActiveRecord::Migration
  def change
    create_table :blood_pressures do |t|
        t.string :name
        t.string :systolic
        t.string :diastolic
    end
  end
end
