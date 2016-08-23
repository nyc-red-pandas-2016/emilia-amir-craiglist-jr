class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true
  validates :email, format: { with: /[@][a-z]+[.][a-z]{3}/, message: "must be in valid format" }
  validates :password, length: { minimum: 6 }

end
