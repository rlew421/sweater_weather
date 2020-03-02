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
end
