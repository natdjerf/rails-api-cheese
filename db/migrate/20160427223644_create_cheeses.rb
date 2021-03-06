# Cheeses
class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :family, null: false
      t.string :name, null: false
      t.string :milk_type, null: false
      t.string :country_of_origin, null: false
      t.string :flavor, null: false

      t.timestamps null: false
    end
  end
end
