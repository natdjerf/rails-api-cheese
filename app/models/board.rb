class Board < ActiveRecord::Base
  belongs_to :user
  has_many :cheeses
  
end
