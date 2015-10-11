class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :brand
      t.string :part_number
      t.string :type

      t.timestamps null: false
    end
  end
end
