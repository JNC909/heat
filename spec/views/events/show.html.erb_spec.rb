require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(event_name: "Event Title", event_link: "Link", event_datetime: DateTime.now))
  end

  it "renders event actions" do
    render
    expect(rendered).to match(/Edit this event/)
    expect(rendered).to match(/Back to events/)
  end
end
