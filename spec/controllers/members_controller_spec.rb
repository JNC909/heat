require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  let(:valid_attributes) {
    { member_name: 'Test Member', member_points: 100, executive_status: true }
  }

  before(:each) do
    @member = Member.create(valid_attributes)
    session[:authenticated] = true
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @member.id }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: @member.id }
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
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        { member_name: 'Updated Name' }
      }

      it "updates the requested member" do
        patch :update, params: { id: @member.id, member: new_attributes }
        @member.reload
        expect(@member.member_name).to eq('Updated Name')
      end

      it "redirects to the member" do
        patch :update, params: { id: @member.id, member: valid_attributes }
        expect(response).to redirect_to(@member)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested member" do
      expect {
        delete :destroy, params: { id: @member.id }
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      delete :destroy, params: { id: @member.id }
      expect(response).to redirect_to(members_url)
    end
  end
end
