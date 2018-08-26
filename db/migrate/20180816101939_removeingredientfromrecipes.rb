class Removeingredientfromrecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :ingredient, :text
    remove_column :recipes, :step, :text
  end
end
