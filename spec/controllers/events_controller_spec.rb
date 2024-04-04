require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before do
    allow(controller).to receive(:require_login).and_return(true)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { event_link: 'http://example.com', event_name: 'Test Event', event_datetime: Time.zone.now } }

    it 'creates a new Event and redirects' do
      expect {
        post :create, params: { event: valid_attributes }
      }.to change(Event, :count).by(1)
      expect(response).to redirect_to(Event.last)
    end
  end
end
