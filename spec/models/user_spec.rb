# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".from_omniauth" do
    context "when user exists" do
      let!(:existing_user) { FactoryBot.create(:user, provider: 'google_oauth2', uid: '123456') }
      # Make sure you have FactoryBot configured properly for creating users

      it "returns the existing user" do
        auth = OmniAuth::AuthHash.new({
          provider: 'google_oauth2',
          uid: '123456',
          info: {
            email: 'test@example.com',
            name: 'Test User',
            image: 'https://example.com/avatar.jpg'
          }
        })
        
        expect(User.from_omniauth(auth)).to eq(existing_user)
      end
    end
  end
end
