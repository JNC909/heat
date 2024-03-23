# spec/models/event_spec.rb

require 'rails_helper'

RSpec.describe Event, type: :model do
  it "creates an event" do
    event = Event.new
    
    expect(event).to be_valid
  end
end
