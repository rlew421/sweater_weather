class Image
  attr_reader :id, :image_url

  def initialize(image_data)
    @id = nil
    @image_url = image_data["results"].first["urls"]["regular"]
  end
end
