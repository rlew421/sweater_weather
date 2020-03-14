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
    CurrentForecast.new(current_forecast_data)
  end

  def parse_daily_forecast(daily_forecast_data)
    number_of_days = 5
    array_of_daily_data = daily_forecast_data["data"][1..number_of_days]

    array_of_daily_data.map do |day_data|
      DailyForecast.new(day_data)
    end
  end

  def parse_hourly_forecast(hourly_forecast_data)
    number_of_hours = 7
    array_of_hourly_data = hourly_forecast_data["data"][1..number_of_hours]

    result = array_of_hourly_data.map do |hourly_data|
      HourlyForecast.new(hourly_data)
    end
  end
end
