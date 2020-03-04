class ImageFacade
  attr_reader :id, :location

  def initialize(location)
    @id = nil
    @location = location
  end

  def get_geolocation
    Geolocation.new(@location)
  end

  def get_image
    image_data = UnsplashService.new.image_by_location(get_geolocation.city, get_geolocation.state)
    Image.new(image_data)
  end
end
