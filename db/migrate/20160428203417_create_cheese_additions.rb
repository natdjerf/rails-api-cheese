# CheeseAdditions to join cheeses & boards
class CreateCheeseAdditions < ActiveRecord::Migration
  def change
    create_table :cheese_additions do |t|
      t.references :board, index: true, foreign_key: true, null: false
      t.references :cheese, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
