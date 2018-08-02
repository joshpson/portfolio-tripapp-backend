class Mapbox < ApplicationRecord

  def self.getDirections(directionsType, userLong, userLat, destLong, destLat)
    response = Faraday.get("https://api.mapbox.com/directions/v5/mapbox/#{directionsType}/#{
        userLong
      }%2C#{userLat}%3B#{destLong}%2C#{
        destLat
      }.json?access_token=#{Rails.application.credentials.mapbox}&geometries=geojson&steps=true")
    response.body
  end

end
