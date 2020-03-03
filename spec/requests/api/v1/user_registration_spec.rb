require 'rails_helper'

RSpec.describe "User Registration API" do
  it "can receive full user registration data and send back an API key" do
    User.destroy_all
    body = {
      "email": "rlew07@gmail.com",
      "password": "password123",
      "password_confirmation": "password123"
    }

    post '/api/v1/users', params: body

    response_api_key = JSON.parse(response.body)

    expect(response_api_key).to be_a Hash
    expect(response_api_key).to have_key "api_key"
    expect(response.status).to eq(201)
  end
end
