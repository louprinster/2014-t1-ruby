class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :equation
      t.integer :choice1
      t.integer :choice2
      t.integer :choice3
      t.integer :choice4
    end
  end
end
