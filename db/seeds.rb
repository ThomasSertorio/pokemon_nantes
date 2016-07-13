# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Pokemon.destroy_all

require 'open-uri'
require 'json'
streets = [
  " Boulevard Adolphe Billault, 44200 Nantes",
  " Rue de la Porte Gellée, 44200 Nantes",
  " Rue des Français Libres, 44200 Nantes",
  " Rue René Viviani, 44200 Nantes",
  " Quai de Malakoff, 44000 Nantes"
]
(1..21).each do |i|
  response = open("http://pokeapi.co/api/v2/pokemon/#{i}")
  json = JSON.parse(response.read.to_s)
  name = json['name']
  category = json['types'][0]['type']['name']
  back_default = json['sprites']['back_default']
  front_default = json['sprites']['front_default']
  address = i.to_s + streets.sample
  Pokemon.create(name: name, address: address, category: category, front_default: front_default, back_default: back_default)
end


