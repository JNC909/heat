# require 'rails_helper'

# RSpec.describe MeetingsController, type: :controller do
#   describe "GET index" do
#     it "redirects to login page if not authenticated" do
#       get :index
#       expect(response).to redirect_to(login_path)
#     end

#     it "renders the index template if authenticated" do
#       session[:authenticated] = true
#       get :index
#       expect(response).to render_template(:index)
#     end
#   end
# end

# spec/controllers/meetings_controller_spec.rb
require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
  describe "#require_login" do
    it "redirects to login page if not authenticated" do
      get :index
      expect(response).to redirect_to(login_path)
      expect(flash[:error]).to eq("You have entered an incorrect password. Please try again.")
    end

    it "does not redirect if authenticated" do
      # Simulate authenticated session
      session[:authenticated] = true

      get :index
      expect(response).not_to redirect_to(login_path)
      expect(flash[:error]).to be_nil
    end
  end
end
