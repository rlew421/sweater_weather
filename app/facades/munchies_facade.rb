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

  def get_munchies_travel_results
    forecast_data = DarkskyService.new.forecast_by_coordinates(destination_coordinates)

    directions_connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/directions/json") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response_1 = directions_connection.get("?origin=#{origin_coordinates.lat},#{origin_coordinates.lng}&destination=#{destination_coordinates.lat},#{destination_coordinates.lng}&key=#{ENV['GOOGLE_GEOCODING_API_KEY']}")

    results = JSON.parse(response_1.body)

    travel_time_data = results["routes"][0]["legs"][0]["duration"]

    yelp_connection = Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end

    response_2 = yelp_connection.get("?latitude=#{destination_coordinates.lat}&longitude=#{destination_coordinates.lng}&term=#{@food_type}")

    restaurant_results = JSON.parse(response_2.body)

    restaurant_data = restaurant_results

    munchies_results = Munchie.new(forecast_data, travel_time_data, restaurant_data)
  end
end
