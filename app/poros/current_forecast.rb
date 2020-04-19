class CurrentForecast
  attr_reader :id,
              :summary,
              :icon,
              :temperature,
              :apparent_temperature,
              :humidity,
              :visibility,
              :uv_index,
              :time

  def initialize(current_forecast_data)
    @summary = current_forecast_data["summary"]
    @icon = current_forecast_data["icon"]
    @temperature = current_forecast_data["temperature"]
    @apparent_temperature = current_forecast_data["apparentTemperature"]
    @humidity = current_forecast_data["humidity"]
    @visibility = current_forecast_data["visibility"]
    @uv_index = current_forecast_data["uvIndex"]
    @time = current_forecast_data["time"]
  end
end
