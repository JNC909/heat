require "google/cloud/text_to_speech"

Google::Cloud::TextToSpeech.configure do |config|
  config.credentials = JSON.parse(ENV['GOOGLE_APPLICATION_CREDENTIALS_JSON'])
end
