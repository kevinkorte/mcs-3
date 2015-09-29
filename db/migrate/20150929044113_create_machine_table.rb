class CreateMachineTable < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :title
      
      t.timestamps null: false
    end
  end
end
