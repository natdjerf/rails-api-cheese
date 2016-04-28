class Board < ActiveRecord::Base
  belongs_to :user, inverse_of: :boards
  has_many :cheeses
end
