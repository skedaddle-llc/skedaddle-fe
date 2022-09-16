require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before(:each) do
    OmniAuth.config.test_mode = true
	  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
        {"provider" => "google_oauth2",
        "uid" => "123456",
        "info" => {
        "name" => "John Doe",
        "email" => "johndoe@example.com",
        },
        "credentials" => {
        "token" => "TOKEN",
        },
        })
  end

  it 'visits the show page and logs out, happy path', :vcr do
    visit '/'

    click_button('Log in with Google')

    expect(current_path).to eql('/dashboard')

    expect(page).to have_content('Welcome, John Doe')

    click_link('Log Out')

    expect(current_path).to eql('/')
    expect(page).to have_no_content('Welcome, John Doe')
  end
end