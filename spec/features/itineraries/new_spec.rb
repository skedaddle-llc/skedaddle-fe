# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New Itinerary' do
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      { 'provider' => 'google_oauth2',
        'uid' => '123456',
        'info' => {
          'name' => 'John Doe',
          'email' => 'johndoe@example.com'
        },
        'credentials' => {
          'token' => 'TOKEN'
        } }
    )
    visit root_path

    click_button('Log in with Google')
  end
  it 'has search location and parks/restaurants displayed', vcr: 'denver_search' do
    expect(current_path).to eq(dashboard_path)
    visit '/itineraries/new?search=denver'
    expect(page).to have_content('Denver Itinerary')
    within '#parks' do
      expect(page).to have_content('Green Mountain')
      expect(page).to have_content('Red Rocks')
      expect(page).to have_content('Indian Creek Loop')
    end

    within '#restaurants' do
      expect(page).to have_content("Harley's A Hot Dog Revolution")
      expect(page).to have_content('Cafe Miriam')
      expect(page).to have_content('Istanbul Cafe And Bakery')
    end
    click_button('Save')
    expect(page).to have_content('Denver Itinerary')
    within '#parks' do
      expect(page).to have_content('Green Mountain')
      expect(page).to have_content('Red Rocks')
      expect(page).to have_content('Indian Creek Loop')
    end

    within '#restaurants' do
      expect(page).to have_content("Harley's A Hot Dog Revolution")
      expect(page).to have_content('Cafe Miriam')
      expect(page).to have_content('Istanbul Cafe And Bakery')
    end
    click_on('Itineraries')
    expect(current_path).to eq(itineraries_path)
    expect(page).to have_content('All Itineraries')
    expect(page).to have_content('Denver')
    click_on('Denver')
    expect(page).to have_content('Denver Itinerary')
    click_on('Delete')
    expect(current_path).to eq(itineraries_path)
    expect(page).to_not have_content('Denver')

    click_on('Log Out')
    visit itineraries_path
    expect(page).to have_content('Must be logged in!')
    expect(current_path).to eq(root_path)
  end

  it 'itinerary with no search SAD PATH', vcr: 'empty_search' do
    expect(current_path).to eq(dashboard_path)

    visit '/itineraries/new?search='
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Search cannot be empty!')
  end

  it 'itinerary with no results SAD PATH', vcr: 'bad_search' do
    expect(current_path).to eq(dashboard_path)

    visit '/itineraries/new?search=qweporiuqwpoeruqpweiru'
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('No results found!')
  end
end
