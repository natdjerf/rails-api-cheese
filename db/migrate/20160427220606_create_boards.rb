class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :cheese1, null: false
      t.string :cheese2, null: false
      t.string :cheese3, null: false
      t.string :cheese4, null: false
      # t.string :complement1, null: false
      # t.string :complement2, null: false
      # t.string :complement3, null: false
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
