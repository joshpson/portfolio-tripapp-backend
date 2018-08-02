class Yelp < ApplicationRecord

  def self.getData(category, latitude, longitude)
    response = Faraday.get("https://api.yelp.com/v3/businesses/search?term=#{category}&latitude=#{latitude}&longitude=#{longitude}", nil, authorization: "Bearer #{Rails.application.credentials.yelp}")
    response.body
  end

  def self.getCategories()
    response = Faraday.get("https://api.yelp.com/v3/categories??locale=en_US", nil, authorization: "Bearer #{Rails.application.credentials.yelp}")
    response.body
  end

  def self.getPhotos(id)
    response = Faraday.get("https://api.yelp.com/v3/businesses/#{id}", nil, authorization: "Bearer #{Rails.application.credentials.yelp}")
    response.body
  end


end
