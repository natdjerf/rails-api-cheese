class Cheese < ActiveRecord::Base
  belongs_to :board, inverse_of: :cheeses
end
