class Mapbox < ApplicationRecord

  def self.getDirections(directionsType, userLong, userLat, destLong, destLat)
    response = Faraday.get("https://api.mapbox.com/directions/v5/mapbox/#{directionsType}/#{
        userLong
      }%2C#{userLat}%3B#{destLong}%2C#{
        destLat
      }.json?access_token=#{Rails.application.credentials.mapbox}&geometries=geojson&steps=true")
    response.body
  end

  def self.search(query)
    response = Faraday.get("https://api.mapbox.com/geocoding/v5/mapbox.places/#{
        query
      }.json?access_token=#{Rails.application.credentials.mapbox}&country=us")
    response.body
  end

  def self.token()
    Rails.application.credentials.mapbox
  end

end
