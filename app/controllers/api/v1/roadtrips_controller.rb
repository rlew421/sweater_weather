class Api::V1::RoadtripsController < ApplicationController
  def create
    if valid_user?
      roadtrip_facade = RoadtripFacade.new(roadtrip_params)
      roadtrip = roadtrip_facade.get_roadtrip
      serialized = RoadtripSerializer.new(roadtrip)
      render json: serialized
    else
      render json: { error: unauthorized }, status: 401
    end
  end

  private

  def roadtrip_params
    params.permit(:origin, :destination)
  end

  def valid_user?
    user = User.find_by(auth_token: params[:api_key])
    user != nil
  end
end
