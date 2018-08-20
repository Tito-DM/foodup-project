class Ingredient <  ApplicationRecord
  belongs_to :recipe
  validates  :ingredient, presence:true
  validates  :qty, presence:true
  validates :recipe_id, presence:true
end