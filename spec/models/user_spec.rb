require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'associations' do
    #add associations here
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:uid) }
  end

  describe 'class methods' do
    it '#from_omniauth' do
      response = {
        :uid=>"123456", :info=>
        {:name=>"John Doe", 
          :email=>"johndoe@example.com"}
        }

      user = User.from_omniauth(response)

      expect(User.last.uid).to eq("123456")
      expect(User.last.name).to eq("John Doe")
      expect(User.last.email).to eq("johndoe@example.com")
    end

  end
end