class TripSerializer < ActiveModel::Serializer
  attributes :id, :city, :start_date, :end_date, :address, :address_latitude, :address_longitude, :image, :status
  has_many :bookmarks
end
