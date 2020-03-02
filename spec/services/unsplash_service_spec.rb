require 'rails_helper'

RSpec.describe UnsplashService do
 it "returns an image by city and state" do
   search = subject.image_by_location("denver", "co")
   expect(search).to be_an Array
 end
end
