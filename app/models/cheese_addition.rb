# Join table to hold board & cheese combos
class CheeseAddition < ActiveRecord::Base
  belongs_to :board, inverse_of: :cheese_additions
  belongs_to :cheese, inverse_of: :cheese_additions
end
