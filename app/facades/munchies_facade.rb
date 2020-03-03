class MunchiesFacade
  attr_reader :id, :origin, :destination, :food_type

  def initialize(origin, destination, food_type)
    @id = nil
    @origin = origin
    @destination = destination
    @food_type = food_type
  end

  def origin_coordinates
    service = GoogleGeocodingService.new
    coordinate_data = service.coordinates_by_city(@origin)
    coordinates = Coordinate.new(coordinate_data)
  end

  def destination_coordinates
    service = GoogleGeocodingService.new
    coordinate_data = service.coordinates_by_city(@destination)
    coordinates = Coordinate.new(coordinate_data)
  end

  def arrival_time
    current_time = Time.now.to_i
    current_time + travel_time_data["value"]
  end

  def travel_time_data
    GoogleGeocodingService.new.estimated_travel_time(origin_coordinates, destination_coordinates)
  end

  def forecast_data
    DarkskyService.new.forecast_by_coordinates_and_time(destination_coordinates, arrival_time)
  end

  def restaurant_data
    YelpService.new.restaurant_by_coordinates_and_type(destination_coordinates, @food_type, arrival_time)
  end

  def get_munchies_travel_results
    Munchie.new(@destination, forecast_data, travel_time_data, restaurant_data)
  end
end
