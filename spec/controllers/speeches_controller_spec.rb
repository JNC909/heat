require 'rails_helper'

RSpec.describe SpeechesController, type: :request do
  describe 'POST #create' do
    it 'returns a success response' do
      post speeches_create_path, params: { text: 'Hello, world!' }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #read_and_convert' do
    it 'returns a success response with valid text content' do
      post speeches_read_and_convert_path, params: 'Hello, world!', headers: { "CONTENT_TYPE" => "text/plain" }
      expect(response).to have_http_status(:success)
    end

    it 'returns an error with no text content' do
      post speeches_read_and_convert_path, params: '', headers: { "CONTENT_TYPE" => "text/plain" }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
