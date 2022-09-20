require 'rails_helper'

RSpec.describe 'New Itinerary' do
  it 'has search location and parks/restaurants displayed', vcr: 'denver_search' do
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
  end
end