class Api::V1::BackgroundsController < ApplicationController
  def show
    image_facade = ImageFacade.new(params[:location])
    image = image_facade.get_image
    serialized = ImageSerializer.new(image)
    render json: serialized
  end
end
