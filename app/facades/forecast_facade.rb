class ForecastFacade
  attr_reader :id

  def initialize(location)
    @id = nil
    @location = location
  end

  def get_coordinates
    service = GoogleGeocodingService.new
    coordinate_data = service.coordinates_by_city(@location)
    coordinates = Coordinate.new(coordinate_data)
  end

  def get_current_forecast
    service = DarkskyService.new
    forecast_data = service.forecast_by_coordinates(get_coordinates)
    binding.pry
    forecast = Forecast.new(forecast_data)
  end
end
