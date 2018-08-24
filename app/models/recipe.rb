class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :ingredient, :dependent => :destroy
  has_many  :steps, :dependent => :destroy
  has_many  :comment, :dependent => :destroy
  has_many  :rate
  validates :name, presence:true
  validates :origin, presence:true
end