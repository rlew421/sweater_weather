class Api::V1::RoadtripsController < ApplicationController
  def create
    roadtrip_facade = RoadtripFacade.new(roadtrip_params)
    roadtrip = roadtrip_facade.get_roadtrip
    serialized = RoadtripSerializer.new(roadtrip)
    render json: serialized
  end

  private

  def roadtrip_params
    params.permit(:origin, :destination)
  end
end
