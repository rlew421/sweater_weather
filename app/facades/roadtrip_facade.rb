class RoadtripFacade
  attr_reader :id, :origin, :destination

  def initialize(roadtrip_params)
    @id = nil
    @origin = roadtrip_params["origin"]
    @destination = roadtrip_params["destination"]
  end
end
