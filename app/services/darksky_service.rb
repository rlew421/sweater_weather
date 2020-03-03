class DarkskyService
  def forecast_by_coordinates(coordinates)
    get_json("#{ENV['DARKSKY_API_KEY']}/#{coordinates.lat},#{coordinates.lng}")
  end

  def forecast_by_coordinates_and_time(coordinates, time)
    get_json("#{ENV['DARKSKY_API_KEY']}/#{coordinates.lat},#{coordinates.lng},#{time}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def conn
    conn = Faraday.new(url: "https://api.darksky.net/forecast/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
