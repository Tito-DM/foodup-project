class DropTables < ActiveRecord::Migration[5.2]
  def up
    drop_table :rates
    drop_table :lovelikes
  end

  def def down
    fail ActiveRecord::IrreversibleMigration
  end
end
