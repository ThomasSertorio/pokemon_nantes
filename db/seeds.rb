# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pokemon.destroy_all
Pokemon.create(name: "Aspifion", address: "Place du massacre, Nantes")
Pokemon.create(name: "Aspifouette", address: "12 Rue Paul Bellamy, Nantes")
Pokemon.create(name: "Pikachu", address: "27 Rue Paul Bellamy, Nantes")
Pokemon.create(name: "Raichu", address: "29 Rue Paul Bellamy, Nantes")
Pokemon.create(name: "Carapuce", address: "45 Rue Paul Bellamy, Nantes")
Pokemon.create(name: "Tortank", address: "56 Rue Paul Bellamy, Nantes")
Pokemon.create(name: "Dracaufeu", address: "56 Rue de la Bastille, Nantes")
Pokemon.create(name: "Salameche", address: "48 Rue de la Bastille, Nantes")
Pokemon.create(name: "Bulbizard", address: "4 rue Chaptal, Paris")
