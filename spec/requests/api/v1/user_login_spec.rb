require 'rails_helper'

RSpec.describe "User Login API" do
  it "can receive a user's email and password and log them in" do
    create_user

    body = {
      "email": "example@gmail.com",
      "password": "password",
    }

    post '/api/v1/sessions', params: body

    login_response = JSON.parse(response.body)
    expect(login_response).to be_a Hash
    expect(response.status).to eq(200)
    expect(login_response["data"]["attributes"]["api_key"]).to eq(@user.auth_token)
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
end
