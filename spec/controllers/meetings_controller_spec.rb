require 'rails_helper'

RSpec.describe MeetingsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Team Meeting', date: Date.today, location: 'Conference Room' }
  }

  let(:new_attributes) {
    { name: 'Updated Meeting', date: Date.tomorrow, location: 'New Location' }
  }

  before do
    allow(controller).to receive(:require_login).and_return(true)
  end

  describe "GET #index" do
    it "returns a success response" do
      Meeting.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Meeting" do
      expect {
        post :create, params: { meeting: valid_attributes }
      }.to change(Meeting, :count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates the requested meeting" do
      meeting = Meeting.create! valid_attributes
      put :update, params: { id: meeting.to_param, meeting: new_attributes }
      meeting.reload
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested meeting" do
      meeting = Meeting.create! valid_attributes
      expect {
        delete :destroy, params: { id: meeting.to_param }
      }.to change(Meeting, :count).by(-1)
    end
  end
end
