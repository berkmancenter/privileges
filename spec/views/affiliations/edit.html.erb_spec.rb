require 'spec_helper'

describe "affiliations/edit" do
  before(:each) do
    @affiliation = assign(:affiliation, stub_model(Affiliation))
  end

  it "renders the edit affiliation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => affiliations_path(@affiliation), :method => "post" do
    end
  end
end
