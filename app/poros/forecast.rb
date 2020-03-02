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
    @hourly = parse_hourly_forecast(forecast_data["hourly"])
  end

  def parse_current_forecast(current_forecast_data)
    {
      summary: current_forecast_data["summary"],
      icon: current_forecast_data["icon"],
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
      icon: daily_forecast_data["icon"],
      temperature_high: daily_forecast_data["data"].first["temperatureHigh"],
      temperature_low: daily_forecast_data["data"].first["temperatureLow"],
      time: daily_forecast_data["data"].first["time"]
    }
  end

  def parse_hourly_forecast(hourly_forecast_data)
    {
      summary: hourly_forecast_data["summary"],
      icon: hourly_forecast_data["icon"],
      time: hourly_forecast_data["data"].first["time"],
      temperature: hourly_forecast_data["data"].first["temperature"],
      humidity: hourly_forecast_data["data"].first["humidity"]
    }
  end
end
