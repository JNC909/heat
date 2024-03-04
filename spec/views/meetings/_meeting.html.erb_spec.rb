require 'rails_helper'

RSpec.describe "meetings/_meeting", type: :view do
  let(:meeting) { Meeting.new(name: "Test Meeting", date: Date.today, location: "Test Location") }

  before do
    assign(:meeting, meeting)
    render partial: "meetings/meeting", locals: { meeting: }
  end

  it "renders the meeting details" do
    expect(rendered).to have_selector("div##{dom_id(meeting)}") do |div|
      expect(div).to have_selector('strong', text: 'Name:')
      expect(div).to have_selector('strong', text: 'Date:')
      expect(div).to have_selector('strong', text: 'Location:')

      expect(div).to have_text('Test Meeting')
      expect(div).to have_text(Date.today.to_s)
      expect(div).to have_text('Test Location')
    end
  end
end
