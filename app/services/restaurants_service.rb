# frozen_string_literal: true

class RestaurantsService
  def self.restaurants_near(city)
    response = conn.get("restaurants?search=#{city}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: 'https://skedaddle-turing-be.herokuapp.com/api/v1')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
