class Forecast
  attr_reader :id,
              :summary,
              :temperature,
              :apparent_temperature,
              :humidity,
              :visibility,
              :uv_index,
              :time,
              :timezone

  def initialize(forecast_data)
    @id = nil
    @summary = forecast_data["currently"]["summary"]
    @temperature = forecast_data["currently"]["temperature"]
    @apparent_temperature = forecast_data["currently"]["apparentTemperature"]
    @humidity = forecast_data["currently"]["humidity"]
    @visibility = forecast_data["currently"]["visibility"]
    @uv_index = forecast_data["currently"]["uvIndex"]
    @time = forecast_data["currently"]["time"]
    @timezone = forecast_data["timezone"]
  end
end
