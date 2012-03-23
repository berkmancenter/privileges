require 'spec_helper'

describe "attendees/show" do
  before(:each) do
    @attendee = assign(:attendee, stub_model(Attendee))
  end

  it "renders attributes in <p>" do
    render
  end
end
