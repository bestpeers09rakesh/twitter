# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
