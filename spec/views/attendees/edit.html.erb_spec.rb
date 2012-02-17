require 'spec_helper'

describe "attendees/edit" do
  before(:each) do
    @attendee = assign(:attendee, stub_model(Attendee))
  end

  it "renders the edit attendee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attendees_path(@attendee), :method => "post" do
    end
  end
end
