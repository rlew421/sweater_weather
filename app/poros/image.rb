class Image
  attr_reader :id, :image_url

  def initialize(image_data)
    @id = nil
    @image_url = image_data.first["urls"]["regular"]
  end
end
