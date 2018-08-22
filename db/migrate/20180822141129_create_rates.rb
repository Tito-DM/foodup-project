class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :rate_number
      t.integer :recipe_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
