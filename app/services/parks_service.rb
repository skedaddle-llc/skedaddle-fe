# frozen_string_literal: true

class ParksService
  def self.parks_near(city)
    response = conn.get("parks?search=#{city}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(url: 'https://skedaddle-turing-be.herokuapp.com/api/v1')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
