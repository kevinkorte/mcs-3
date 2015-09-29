class CreateMachineTable < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :title
    end
  end
end
