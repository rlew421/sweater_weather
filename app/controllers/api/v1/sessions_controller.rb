class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if logs_in_successfully?(user)
      render json: UserSerializer.new(user), status: 200
    else
      render json: { description: "Bad Credentials" }, status: 401
    end
  end

  private

  def logs_in_successfully?(user)
    user && user.authenticate(params[:password])
  end
end
