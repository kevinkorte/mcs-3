class AddMakesToMachineDetails < ActiveRecord::Migration
  def change
    add_column :machine_details, :make_id, :integer
  end
end
