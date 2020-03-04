class Roadtrip
  attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast

  def initialize(origin, destination, travel_time_data, forecast_data)
    @id = nil
    @origin = origin
    @destination = destination
    @travel_time = travel_time_data["text"]
    @arrival_forecast = parse_forecast_data(forecast_data["currently"])
  end

  def parse_forecast_data(expected_forecast_data)
    {
      temperature: expected_forecast_data["temperature"],
      summary: expected_forecast_data["summary"]
    }
  end
end
