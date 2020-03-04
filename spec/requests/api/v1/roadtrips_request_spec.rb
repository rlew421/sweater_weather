require 'rails_helper'

RSpec.describe "Roadtrips API" do
  it "sends roadtrip info including:
  - origin location
  - destination location
  - estimated travel time
  - arrival forecast" do
    create_user
    login_user

    body = {
      origin: "denver,co",
      destination: "pueblo,co",
      api_key: @user.auth_token
    }

    post '/api/v1/road_trip', params: body

    roadtrip_response = JSON.parse(response.body)
    expect(road_trip.response).to be_successful
  end

  def create_user
    User.destroy_all
    body = {
      "email": "example@gmail.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: body
    @user = User.last
  end

  def login_user
    body = {
      "email": "example@gmail.com",
      "password": "password",
    }

    post '/api/v1/sessions', params: body
  end
end
