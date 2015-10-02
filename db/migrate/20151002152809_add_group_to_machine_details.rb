class AddGroupToMachineDetails < ActiveRecord::Migration
  def change
    add_column :machine_details, :group_id, :integer
  end
end
