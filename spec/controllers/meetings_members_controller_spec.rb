require 'rails_helper'

RSpec.describe MeetingsMembersController, type: :controller do
  let(:meeting) { Meeting.create!(name: 'Team Meeting', date: Date.today, location: 'Conference Room') }
  let(:member) { Member.create!(member_name: 'John Doe', member_points: 100, executive_status: false) }
  let(:valid_attributes) { { meeting_id: meeting.id, member_id: member.id } }

  describe "GET #index" do
    it "returns a success response" do
      MeetingsMember.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new MeetingsMember association" do
      expect do
        post :create, params: { meetings_member: valid_attributes }
      end.to change(MeetingsMember, :count).by(1)
    end
  end
end
