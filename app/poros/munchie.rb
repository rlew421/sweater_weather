class Munchie
  attr_reader :id, :current_time, :expected_weather, :estimated_travel_time, :estimated_arrival_time, :restaurant_data

  def initialize(forecast_data, travel_time_data, restaurant_data)
    @id = nil
    @current_time = Time.now.to_i
    @expected_weather = forecast_data["hourly"]["data"][0]
    @estimated_travel_time = travel_time_data
    @estimated_arrival_time = @current_time + @estimated_travel_time["value"]
    @restaurant_data = restaurant_data["businesses"].first
  end
end
