class MunchiesFacade
  attr_reader :origin, :destination, :food_type

  def initialize(origin, destination, food_type)
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

  def get_munchies_travel_results
    directions_connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = directions_connection.get("?origin=#{origin_coordinates.lat},#{origin_coordinates.lng}&destination=#{destination_coordinates.lat},#{destination_coordinates.lng}&key=#{ENV['GOOGLE_GEOCODING_API_KEY']}")

    results = JSON.parse(response.body)
    
    travel_time_data = results["routes"][0]["legs"][0]["duration"]
  end
end
