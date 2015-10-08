class CreateAirFilters < ActiveRecord::Migration
  def change
    create_table :air_filters do |t|
      t.string :brand
      t.string :part_number
      t.timestamps null: false
    end
  end
end
