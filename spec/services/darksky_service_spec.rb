require 'rails_helper'

RSpec.describe DarkskyService do
 it "returns forecast by coordinates" do
   search = subject.forecast_by_coordinates(39.7392358, -104.990251)
   expect(search).to be_a Hash
   expect(search).to have_key "currently"
   expect(search).to have_key "minutely"
   expect(search).to have_key "hourly"
 end
end
