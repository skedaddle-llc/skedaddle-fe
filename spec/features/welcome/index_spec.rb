# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome Page' do
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
  end

  it 'visits the welcome page, happy path', :vcr do
    visit root_path

    expect(page).to have_button('Log in with Google')

    click_button('Log in with Google')

    expect(User.last.uid).to eq('123456')
    expect(User.last.email).to eq('johndoe@example.com')

    expect(current_path).to eql('/dashboard')

    expect(page).to have_content('Welcome, John Doe')
    expect(page).to have_link('Log Out')
  end
end
