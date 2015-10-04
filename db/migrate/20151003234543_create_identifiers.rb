class CreateIdentifiers < ActiveRecord::Migration
  def change
    create_table :identifiers do |t|
      t.string :identifier
      t.timestamps null: false
    end
  end
end
