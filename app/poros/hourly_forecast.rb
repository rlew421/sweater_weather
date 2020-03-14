class HourlyForecast
  attr_reader :id, :hour, :summary, :icon, :temperature, :humidity

  def initialize(hourly_forecast_data)
    @id = nil
    @hour = Time.at(hourly_forecast_data["time"]).strftime("%l"),
    @summary = hourly_forecast_data["summary"],
    @icon = hourly_forecast_data["icon"],
    @temperature = hourly_forecast_data["temperature"],
    @humidity = hourly_forecast_data["humidity"]
  end
end
