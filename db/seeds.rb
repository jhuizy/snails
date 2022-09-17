# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p1 = Person.create!(name: 'Jordan')
p2 = Person.create!(name: 'Claire')
game = Game.create!

GamePerson.create!(game: game, person: p1)
GamePerson.create!(game: game, person: p2)

puts game.id