class Recipe < ApplicationRecord
  belongs_to :user
  has_many  :ingredient, :dependent => :destroy
  has_many  :steps, :dependent => :destroy
  has_many  :comment, :dependent => :destroy
  has_many  :dislike, :dependent => :destroy
  has_many  :favorite, :dependent => :destroy
  before_save { self.name = name.downcase}
  before_save { self.origin = origin.downcase}
  has_attached_file :image, style: { medium: "300x300>", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence:true
  validates :origin, presence:true

  def self.check_dislike recipe, user
    @recipe = Recipe.find(recipe.id)
    @recipe.favorite.each {|f| return true if f.user_id == user.id}
    @recipe.dislike.each {|d| return true if d.user_id == user.id}
    false
  end

  def self.check_favorite recipe, user
    @recipe = Recipe.find(recipe.id)
    @recipe.dislike.each {|d| return true if d.user_id == user.id}
    @recipe.favorite.each {|f| return true if f.user_id == user.id}
    false
  end
end