# frozen_string_literal: true
class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true, length: { minimum: 6, message: 'Please enter equal and greater then 6' }

  has_one :profile, dependent: :destroy
  # has_many :objects, class_name: "object", foreign_key: "reference_id", dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_id, class_name: "Follow"
  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower
  
  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"  
  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :followed

  after_create :create_profile
  
  private

    def create_profile
      self.create_profile!
    end

end
