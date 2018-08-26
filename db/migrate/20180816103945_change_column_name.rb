class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :food_origen, :origin
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
