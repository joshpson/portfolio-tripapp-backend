class Yelp < ApplicationRecord

  def self.getData(category, latitude, longitude)
    response = Faraday.get("https://api.yelp.com/v3/businesses/search?term=#{category}&latitude=#{latitude}&longitude=#{longitude}", nil, authorization: "Bearer #{Rails.application.credentials.yelp}")
    response.body
  end


end
