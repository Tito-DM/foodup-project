class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :ingredient
      t.string :qty
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
