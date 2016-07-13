class RenameTypeTocategory < ActiveRecord::Migration
  def change
    rename_column :pokemons, :type, :category
  end
end
