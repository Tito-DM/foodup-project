class CreateLovelike < ActiveRecord::Migration[5.2]
  def change
    create_table :lovelikes do |t|
      t.integer :dislike
      t.integer :love_it
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
