class YelpService
  def restaurant_by_coordinates_and_type(destination_coordinates, food_type, expected_time)
    get_json("?latitude=#{destination_coordinates.lat}&longitude=#{destination_coordinates.lng}&term=#{food_type}&open_at=#{expected_time}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{ENV['YELP_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end
  end
end
