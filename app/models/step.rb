class Step < ApplicationRecord
  belongs_to :recipe
  validates :step, presence:true
  validates :recipe_id, presence:true

end