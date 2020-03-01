require 'rails_helper'

RSpec.describe GoogleGeocodingService do
 it "returns forecast by city" do
   search = subject.forecast_by_city("Denver")
   expect(search).to be_a Hash
   expect(search["results"][0]["geometry"]["location"]["lat"]).to eq(39.7392358)
   expect(search["results"][0]["geometry"]["location"]["lng"]).to eq(-104.990251)
 end
end
