require 'spec_helper'

describe "attendees/new" do
  before(:each) do
    assign(:attendee, stub_model(Attendee).as_new_record)
  end

  it "renders new attendee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attendees_path, :method => "post" do
    end
  end
end
