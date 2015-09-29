class CreateMachineTable < ActiveRecord::Migration
  def change
    create_table :machine_tables do |t|
      t.string :title
    end
  end
end
