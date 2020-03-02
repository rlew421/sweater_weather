class UnsplashService
  def image_by_location(city, state)
    conn = Faraday.new(url: "https://api.unsplash.com/search") do |faraday|
      faraday.headers["Authorization"] = "Client-ID #{ENV['UNSPLASH_API_KEY']}"
      faraday.adapter Faraday.default_adapter
    end

    response = conn.get("/photos?query=#{city}&query=#{state}")

    parsed = JSON.parse(response.body)
  end
end
