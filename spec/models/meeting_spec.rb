# spec/models/meeting_spec.rb

require 'rails_helper'

RSpec.describe Meeting, type: :model do
  it "is valid with name, date, time, and location" do
    meeting = Meeting.new(
      name: "Sample Meeting",
      date: Date.today,
      time: Time.now,
      location: "Sample Location"
    )
    expect(meeting).to be_valid
  end
end
