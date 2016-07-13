class AddBackDefaultToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :back_default, :string
    rename_column :pokemons, :picture, :front_default
  end
end
