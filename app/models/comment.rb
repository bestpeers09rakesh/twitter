class Comment < ApplicationRecord
  validates :description, presence: true
  validates :user, presence: true
  validates :post, presence: true

  belongs_to :user
  belongs_to :post
end
