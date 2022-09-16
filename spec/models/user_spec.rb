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
end