require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'visits the welcome page', :vcr do
    visit '/'

    expect(page).to have_button('Log in with Google')

    click_button('Log in with Google')


  end
end
  
