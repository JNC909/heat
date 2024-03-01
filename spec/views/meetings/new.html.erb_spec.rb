# spec/views/meetings/new.html.erb_spec.rb

require 'rails_helper'

RSpec.describe "meetings/new", type: :view do
  let(:meeting) { Meeting.new }

  before(:each) do
    assign(:meeting, meeting)
    render
  end

  it "renders the meeting form" do
    expect(rendered).to include('<h1>Add a meeting</h1>')
    expect(rendered).to include('<form', 'class="meeting-form"', 'action="/meetings"', 'method="post"')
    expect(rendered).to include('<input', 'class="form-control"', 'placeholder="Enter meeting name"', 'type="text"', 'name="meeting[name]"')
    expect(rendered).to include('<input', 'class="form-control"', 'placeholder="Select meeting date"', 'type="date"', 'name="meeting[date]"')
    expect(rendered).to include('<input', 'class="form-control"', 'placeholder="Enter meeting location"', 'type="text"', 'name="meeting[location]"')
    expect(rendered).to include('<input', 'type="submit"', 'value="Save Meeting"')
  end

  it "renders a link back to meetings" do
    expect(rendered).to include('<a href="/meetings">Back to meetings</a>')
  end
end
