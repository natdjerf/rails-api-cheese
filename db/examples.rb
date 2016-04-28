require 'csv'
# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# %w(antony jeff matt jason).each do |name|
#   email = "#{name}@#{name}.com"
#   next if User.exists? email: email
#   User.create!(email: email,
#                password: 'abc123',
#                password_confirmation: nil)
# end
desc 'Fill the cheeses table with example data'
Cheese.transaction do
  CSV.foreach(Rails.root + 'data/cheeses.csv',
              headers: true) do |cheese_row|
    cheese = cheese_row.to_hash
    next if Cheese.exists? cheese
    Cheese.create!(cheese)
  end
end
