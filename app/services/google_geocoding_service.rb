class GoogleGeocodingService
  def forecast_by_city(city)
    response = conn.get("?key=#{ENV['GOOGLE_GEOCODING_API_KEY']}&address=#{city}")
    parsed = JSON.parse(response.body)
  end

  private

  def conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
