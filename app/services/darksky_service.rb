class DarkskyService
  def forecast_by_coordinates(lat, long)
    get_json("#{ENV['DARKSKY_API_KEY']}/#{lat},#{long}")
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
