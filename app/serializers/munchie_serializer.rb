class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :estimated_travel_time,
             :current_time,
             :expected_weather,
             :estimated_travel_time,
             :estimated_arrival_time,
             :restaurant_data
end
