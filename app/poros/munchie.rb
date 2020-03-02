class Munchie
  attr_reader :id, :forecast, :travel_time, :restaurant

  def initialize(forecast_data, travel_time_data, restaurant_data)
    @id = nil
    @forecast = forecast_data["hourly"]["data"][0]["summary"]
    @travel_time = travel_time_data["text"]
    @restaurant = parse_restaurant_data(restaurant_data)
  end

  def parse_restaurant_data(restaurant_data)
    {
      name: restaurant_data["businesses"].first["name"],
      address: restaurant_data["businesses"].first["location"]
    }
  end
end
