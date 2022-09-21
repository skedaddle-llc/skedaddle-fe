# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RestaurantsService do
  it 'gets restaurants', vcr: 'denver_restaurants' do
    response = RestaurantsService.restaurants_near('Denver')
    expect(response).to be_a(Array)
    expect(response.length).to eq(3)
    response.each do |restaurant|
      expect(restaurant).to have_key(:name)
      expect(restaurant).to have_key(:rating)
      expect(restaurant).to have_key(:price)
      expect(restaurant).to have_key(:image_url)
      expect(restaurant).to have_key(:url)
      expect(restaurant).to have_key(:categories)
      expect(restaurant).to have_key(:address)
      expect(restaurant).to have_key(:phone)
    end
  end
end
