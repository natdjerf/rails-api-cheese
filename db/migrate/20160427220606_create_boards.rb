# Boards
class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
