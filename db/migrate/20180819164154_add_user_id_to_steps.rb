class AddUserIdToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :recipe_id, :integer
  end
end
