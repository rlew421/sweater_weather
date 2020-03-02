class Geolocation
  attr_reader :city, :state
  
  def initialize(location)
    @city = location.split(",").first
    @state = location.split(",").second
  end
end
