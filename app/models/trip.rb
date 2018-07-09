class Trip < ApplicationRecord
  # validates :city, presence: true
  # validates :address, presence: true
  has_many :bookmarks
end
