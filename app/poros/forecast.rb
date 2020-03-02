class Forecast
  attr_reader :id,
              :timezone,
              :currently,
              :daily,
              :hourly

  def initialize(forecast_data)
    @id = nil
    @timezone = forecast_data["timezone"]
    @currently = parse_current_forecast(forecast_data["currently"])
    @daily = parse_daily_forecast(forecast_data["daily"])
  end

  def parse_current_forecast(current_forecast_data)
    {
      summary: current_forecast_data["summary"],
      temperature: current_forecast_data["temperature"],
      apparent_temperature: current_forecast_data["apparentTemperature"],
      humidity: current_forecast_data["humidity"],
      visibility: current_forecast_data["visibility"],
      uv_index: current_forecast_data["uvIndex"],
      time: current_forecast_data["time"]
    }
  end

  def parse_daily_forecast(daily_forecast_data)
    {
      summary: daily_forecast_data["summary"],
      temperature_high: daily_forecast_data["data"].first["temperatureHigh"],
      temperature_low: daily_forecast_data["data"].first["temperatureLow"],
      time: daily_forecast_data["data"].first["time"]
    }
  end
end
