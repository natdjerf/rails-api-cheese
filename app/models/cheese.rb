# Available cheeses
class Cheese < ActiveRecord::Base
  has_many :cheese_additions
  has_many :boards, through: :cheese_additions
end
