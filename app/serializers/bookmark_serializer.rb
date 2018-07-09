class BookmarkSerializer < ActiveModel::Serializer
  attributes :id, :category, :title, :description, :address, :api_service, :api_id, :trip_id, :image
  belongs_to :trip
end
