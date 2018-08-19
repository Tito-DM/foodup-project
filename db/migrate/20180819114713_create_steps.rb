class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :step
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
