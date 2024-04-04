require 'rails_helper'

RSpec.describe EventsMembersController, type: :controller do
  let(:valid_event_attributes) do
    { event_link: 'http://example.com', event_name: 'Sample Event', event_datetime: DateTime.now }
  end
  let(:valid_member_attributes) do
    { member_name: 'John Doe', member_points: 0, executive_status: false }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let!(:event) { Event.create!(valid_event_attributes) }
    let!(:member) { Member.create!(valid_member_attributes) }
    let(:valid_attributes) { { event_id: event.id, member_id: member.id } }

    it 'adds a new member to an event' do
      expect do
        post :create, params: { events_member: valid_attributes }
      end.to change(EventsMember, :count).by(1)
    end
  end
end
