class User < ApplicationRecord
  has_many :trips
  has_many :bookmarks, through: :trips
  validates_presence_of :email, :password_digest
  validates :email, uniqueness: true
  has_secure_password


  def to_token_payload
      {sub: id, email: email}
  end


end
