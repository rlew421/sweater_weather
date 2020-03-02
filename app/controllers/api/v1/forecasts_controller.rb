class Api::V1::ForecastsController < ApplicationController
  def show
    forecast_facade = ForecastFacade.new(params[:location])
    forecast = forecast_facade.get_forecast
    serialized = ForecastSerializer.new(forecast)
    render json: serialized
  end
end
