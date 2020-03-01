class DarkskyService
  def forecast_by_coordinates(lat, long)
    conn = Faraday.new(url: "https://api.darksky.net/forecast/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("#{ENV['DARKSKY_API_KEY']}/#{lat},#{long}")

    parsed = JSON.parse(response.body)
  end
end
