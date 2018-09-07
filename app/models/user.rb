class User < ApplicationRecord
  has_many :recipes, :dependent => :destroy
  has_one :dislike,:dependent => :destroy
  has_one :favorite,:dependent => :destroy
  before_save { self.email = email.downcase}
  before_save { self.name = name.downcase}
  validates :name, presence:true, length: {minimum:3, maximum:50}
  VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, uniqueness: {case_sensitive: false},format: {with:VALID_EMAIL_REGX}

  has_secure_password
end