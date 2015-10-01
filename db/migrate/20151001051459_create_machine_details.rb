class CreateMachineDetails < ActiveRecord::Migration
  def change
    create_table :machine_details do |t|
      t.integer :year_id
      t.integer :machine_id
      t.timestamps null: false
    end
  end
end
