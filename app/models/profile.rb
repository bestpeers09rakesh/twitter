class Profile < ApplicationRecord
  belongs_to :user
  validates :name, :last_name, :mobile, :dob, presence :true

end
