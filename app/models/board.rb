# Boards are owned by users
class Board < ActiveRecord::Base
  belongs_to :user, inverse_of: :boards
  has_many :cheese_additions
  has_many :cheeses, through: :cheese_additions
end
