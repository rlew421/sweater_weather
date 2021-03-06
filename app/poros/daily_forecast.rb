class DailyForecast
  attr_reader :id, :day, :summary, :icon, :temperature_high, :temperature_low

  def initialize(daily_forecast_data)
    @id = nil
    @day = Time.at(daily_forecast_data["time"]).strftime("%A"),
    @summary = daily_forecast_data["summary"],
    @icon = daily_forecast_data["icon"],
    @temperature_high = daily_forecast_data["temperatureHigh"],
    @temperature_low = daily_forecast_data["temperatureLow"]
  end
end
