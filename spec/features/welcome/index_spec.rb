require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'visits the welcome page', :vcr do
    visit '/'

    expect(page).to have_button('Log in with Google')

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

    click_button('Log in with Google')

    expect(current_path).to eql('/dashboard')
    expect(User.last.uid).to eq("123456")
    expect(User.last.email).to eq("johndoe@example.com")
    expect(page).to have_content('Welcome, John Doe')

  end
end
  
