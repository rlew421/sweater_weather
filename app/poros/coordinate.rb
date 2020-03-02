class Coordinate
  attr_reader :lat, :lng

  def initialize(location)
    @lat = location["results"][0]["geometry"]["location"]["lat"]
    @lng = location["results"][0]["geometry"]["location"]["lng"]
  end
end
