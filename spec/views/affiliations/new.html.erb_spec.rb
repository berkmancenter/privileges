require 'spec_helper'

describe "affiliations/new" do
  before(:each) do
    assign(:affiliation, stub_model(Affiliation).as_new_record)
  end

  it "renders new affiliation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliations_path, :method => "post" do
    end
  end
end
