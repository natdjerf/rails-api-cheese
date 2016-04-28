class CheeseSerializer < ActiveModel::Serializer
  attributes :id, :family, :name, :milk_type, :country_of_origin, :flavor
end
