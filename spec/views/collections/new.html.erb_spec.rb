require 'spec_helper'

describe "collections/new" do
  before(:each) do
    assign(:collection, stub_model(Collection).as_new_record)
  end

  it "renders new collection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => collections_path, :method => "post" do
    end
  end
end
