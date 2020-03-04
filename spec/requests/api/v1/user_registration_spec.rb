require 'rails_helper'

RSpec.describe "User Registration API" do
  it "can receive full user registration data and send back an API key" do
    User.destroy_all
    body = {
      "email": "example@gmail.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post '/api/v1/users', params: body

    response_api_key = JSON.parse(response.body)
    expect(response_api_key).to be_a Hash
    expect(response.status).to eq(200)
    user = User.last
    expect(response_api_key["data"]["attributes"]["api_key"]).to eq(user.auth_token)
  end
end
