class AddAttachmentVideoToRecipes < ActiveRecord::Migration[5.2]
  def self.up
    change_table :recipes do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :recipes, :video
  end
end
