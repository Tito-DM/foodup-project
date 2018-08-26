class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :food_origen
      t.text :ingredient
      t.text :step

      t.timestamps
    end
  end
end
