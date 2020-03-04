class GoogleGeocodingService
  def coordinates_by_city(city)
    get_json("?key=#{ENV['GOOGLE_GEOCODING_API_KEY']}&address=#{city}")
  end

  def estimated_travel_time(origin_coordinates, destination_coordinates)
    response = directions_conn.get("?origin=#{origin_coordinates.lat},#{origin_coordinates.lng}&destination=#{destination_coordinates.lat},#{destination_coordinates.lng}&key=#{ENV['GOOGLE_GEOCODING_API_KEY']}")

    results = JSON.parse(response.body)

    results["routes"][0]["legs"][0]["duration"]
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def directions_conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
