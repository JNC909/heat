require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  before(:all) do
    Rails.application.routes.draw do
      get 'dummy/index'
    end
  end

  after(:all) do
    Rails.application.reload_routes!
  end

  controller(DummyController) do
    def index
      render plain: "Current User: #{current_user ? current_user.email : 'none'}"
    end
  end

  describe "#current_user" do
    let!(:user) { FactoryBot.create(:user, email: "user@example.com") }

    it "returns the user based on session[:user_id]" do
      session[:user_id] = user.id
      get :index
      expect(response.body).to include(user.email)
    end

    it "returns nil when no user_id in session" do
      get :index
      expect(response.body).to include('none')
    end
  end
end
