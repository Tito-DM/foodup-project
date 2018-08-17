class Recipe < ApplicationRecord
  validates :name, presence:true
  validates :origin, presence:true
end