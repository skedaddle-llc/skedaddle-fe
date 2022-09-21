# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  it "visits the show page but it's not logged in SAD PATH" do
    visit '/dashboard'
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Must be logged in!')
  end
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

  it 'visits the show page and logs out, happy path', :vcr do
    visit root_path

    click_button('Log in with Google')

    expect(current_path).to eql('/dashboard')

    expect(page).to have_content('Welcome, John Doe')

    click_link('Log Out')

    expect(current_path).to eql(root_path)
    expect(page).to have_no_content('Welcome, John Doe')
  end
end
