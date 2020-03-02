class Api::V1::MunchiesController < ApplicationController
  def show
    munchies_facade = MunchiesFacade.new(params[:start], params[:end], params[:food])
    munchies_results = munchies_facade.get_munchies_travel_results
    serialized = MunchieSerializer.new(munchies_results)
    render json: serialized
  end
end
