class GoogleGeocodingService
  def forecast_by_city(city)
    connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = connection.get("?key=#{ENV['GOOGLE_GEOCODING_API_KEY']}&address=#{city}")
    parsed = JSON.parse(response.body)
  end
end
