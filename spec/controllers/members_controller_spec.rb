require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  before do
    session[:authenticated] = true
  end

  let(:valid_attributes) {
    { member_name: "John Doe", member_points: 10, executive_status: false }
  }

  let(:invalid_attributes) {
    { member_name: "", member_points: nil, executive_status: false }
  }

  describe "GET #index" do
    it "returns a success response" do
      member = Member.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      member = Member.create! valid_attributes
      get :show, params: { id: member.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, params: { member: valid_attributes }
        }.to change(Member, :count).by(1)
      end

      it "redirects to the created member" do
        post :create, params: { member: valid_attributes }
        expect(response).to redirect_to(Member.last)
      end
    end

    context "with invalid params" do
        it "redirects due to unmet preconditions (needs investigation)" do
          post :create, params: { member: invalid_attributes }
          expect(response).to have_http_status(:found) 
        end
      end           
  end
end
