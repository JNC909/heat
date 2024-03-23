# spec/services/text_to_speech_service_spec.rb

require 'rails_helper'

RSpec.describe TextToSpeechService do
  describe ".synthesize" do
    it "returns audio content" do
      text = "Hello, world!"
      fake_response = double("response", audio_content: "fake_audio_content")
      fake_client = double("client", synthesize_speech: fake_response)
      
      allow(Google::Cloud::TextToSpeech).to receive(:text_to_speech).and_return(fake_client)
      
      audio_content = TextToSpeechService.synthesize(text)
      
      expect(audio_content).to eq("fake_audio_content")
    end
  end
end
