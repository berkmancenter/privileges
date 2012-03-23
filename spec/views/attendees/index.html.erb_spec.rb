require 'spec_helper'

describe "attendees/index" do
  before(:each) do
    assign(:attendees, [
      stub_model(Attendee),
      stub_model(Attendee)
    ])
  end

  it "renders a list of attendees" do
    render
  end
end
