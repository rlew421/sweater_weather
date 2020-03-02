class UnsplashService
  def image_by_location(city, state)
    get_json("/photos?query=#{city}&query=#{state}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body)
  end

  def conn
    Faraday.new(url: "https://api.unsplash.com/search") do |faraday|
      faraday.headers["Authorization"] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end
  end
end
