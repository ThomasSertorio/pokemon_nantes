class AddInfoToPokemon < ActiveRecord::Migration
  def change
    add_column :pokemons, :type, :string
    add_column :pokemons, :picture, :string
  end
end
