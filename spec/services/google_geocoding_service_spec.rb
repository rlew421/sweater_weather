require 'rails_helper'

RSpec.describe GoogleGeocodingService do
 # xit "returns coordinates" do
 #   search = subject.coordinates_by_city("Denver")
 #   expect(search).to be_a Hash
 #   expect(search["results"][0]["geometry"]["location"]["lat"]).to eq(39.7392358)
 #   expect(search["results"][0]["geometry"]["location"]["lng"]).to eq(-104.990251)
 # end

 it "returns estimated travel time" do
   origin_location = "denver,co"
   destination_location = "pueblo,co"
   # origin_coordinates = 39.7392358,-104.990251
   # destination_coordinates = 38.2544472,-104.6091409
   search = subject.estimated_travel_time(origin_location, destination_location)
   expect(search).to be_a Hash
   expect(search["text"]).to eq("1 hour 46 mins")
   expect(search["value"]).to eq(6382)
 end
end
