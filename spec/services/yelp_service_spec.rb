require 'rails_helper'

RSpec.describe YelpService do
 it "returns restaurant data" do
   origin_coordinates = ({lat: 39.7392358,long: 104.990251})
   destination_coordinates =({lat: 38.2544472,long: -104.6091409})
   food_type = "chinese"
   search = subject.restaurant_by_coordinates_and_type(origin_coordinates, destination_coordinates, food_type)
   expect(search).to be_a Hash
 end
end
