class MunchieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :travel_time,
             :forecast,
             :restaurant
end
