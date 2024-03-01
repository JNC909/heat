require 'rails_helper'

RSpec.describe "meetings/edit", type: :view do
  let(:meeting) { Meeting.create(name: "Sample Meeting", date: Date.today, location: "Sample Location") }

  before(:each) do
    assign(:meeting, meeting)
    render
  end

  it "renders the form partial" do
    expect(rendered).to include('<h1>Editing meeting</h1>')
    expect(rendered).to include('<form', 'class="meeting-form"', "action=\"#{meeting_path(meeting)}\"", 'method="post"')
    expect(rendered).to include('<input', 'class="form-control"', 'placeholder="Enter meeting name"', 'type="text"', 'name="meeting[name]"')
    expect(rendered).to include('<input', 'class="form-control"', 'placeholder="Select meeting date"', 'type="date"', 'name="meeting[date]"')
    expect(rendered).to include('<input', 'class="form-control"', 'placeholder="Enter meeting location"', 'type="text"', 'name="meeting[location]"')
    expect(rendered).to include('<input', 'type="submit"', 'value="Save Meeting"')
  end

  it "renders links to show meeting and back to meetings" do
    expect(rendered).to have_link("Back to meetings", href: meetings_path)
  end
end
