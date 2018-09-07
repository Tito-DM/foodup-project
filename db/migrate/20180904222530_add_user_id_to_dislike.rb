class AddUserIdToDislike < ActiveRecord::Migration[5.2]
  def change
    add_column :dislikes, :user_id, :integer
  end
end
