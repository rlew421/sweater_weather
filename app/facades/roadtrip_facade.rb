class RoadtripFacade
  attr_reader :id, :origin, :destination

  def initialize(roadtrip_params)
    @id = nil
    @origin = roadtrip_params["origin"]
    @destination = roadtrip_params["destination"]
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

  def get_roadtrip
    Roadtrip.new(@origin, @destination, travel_time_data, forecast_data)
  end
end
