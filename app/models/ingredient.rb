class Ingredient <  ApplicationRecord
  belongs_to :recipe
  validates :recipe_id, presence:true
end