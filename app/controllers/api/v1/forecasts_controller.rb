class Api::V1::ForecastsController < ApplicationController
  def show
    forecast_facade = ForecastFacade.new(params[:location])
    forecast = forecast_facade.get_current_forecast
    serialized = ForecastSerializer.new(forecast)
    # binding.pry
    render json: serialized
  end
end
