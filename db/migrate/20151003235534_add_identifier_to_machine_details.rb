class AddIdentifierToMachineDetails < ActiveRecord::Migration
  def change
    add_column :machine_details, :identifier_id, :integer
  end
end
