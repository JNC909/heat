require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    assign(:event, Event.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
