class User < ApplicationRecord
  has_many :trips
  has_many :bookmarks, through: :trips
  validates :email, presence: true, uniqueness: true
  has_secure_password


end
