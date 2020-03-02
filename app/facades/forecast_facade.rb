class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def get_geolocation
    Geolocation.new(@location)
  end

  def get_coordinates
    service = GoogleGeocodingService.new
    coordinate_data = service.coordinates_by_city(@location)
    coordinates = Coordinate.new(coordinate_data)
  end

  def get_forecast
    forecast_data = DarkskyService.new.forecast_by_coordinates(get_coordinates)
    image_data = UnsplashService.new.image_by_location(get_geolocation.city, get_geolocation.state)
    forecast = Forecast.new(forecast_data, image_data)
  end

  # def get_estimated_travel_time(origin_location, destination_location)
  #   service = GoogleGeocodingService.new
  #   origin_coordinates = service.coordinates_by_city(origin_location)
  #   directions_connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json") do |faraday|
  #     faraday.adapter Faraday.default_adapter
  #   end
  #
  #   response = directions_connection.get("?origin=39.7392358,-104.990251&destination=38.2544472,-104.6091409&key=#{ENV['GOOGLE_GEOCODING_API_KEY']}")
  #
  #   results = JSON.parse(response.body)
  #   final = results["routes"][0]["legs"][0]["duration"]
  # end
end
