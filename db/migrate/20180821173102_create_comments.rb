class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :recipe_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
