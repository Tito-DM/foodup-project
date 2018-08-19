class Recipe < ApplicationRecord
  has_many  :ingredient
  has_many   :steps
  validates :name, presence:true
  validates :origin, presence:true
end