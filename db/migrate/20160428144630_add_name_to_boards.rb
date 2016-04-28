class AddNameToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :name, :string, null: false
  end
end
