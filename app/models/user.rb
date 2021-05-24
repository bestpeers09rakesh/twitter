class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true 
  validates :password, confirmation: true, length: {minimum: 6, message: "Please enter equal and greater then 6"}
end
