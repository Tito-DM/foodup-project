class Recipe < ApplicationRecord
  has_many  :ingredient
  has_many  :steps
  has_many  :comment
  validates :name, presence:true
  validates :origin, presence:true
end