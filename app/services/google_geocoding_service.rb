class GoogleGeocodingService
  def coordinates_by_city(city)
    get_json("?key=#{ENV['GOOGLE_GEOCODING_API_KEY']}&address=#{city}")
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
end
