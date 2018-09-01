class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :ingredient, :dependent => :destroy
  has_many  :steps, :dependent => :destroy
  has_many  :comment, :dependent => :destroy
  has_many  :rate
  has_attached_file :image, style: { medium: "300x300>", thumb: "150x150#"}
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence:true
  validates :origin, presence:true
end