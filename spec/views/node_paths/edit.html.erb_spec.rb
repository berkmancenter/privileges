require 'spec_helper'

describe "node_paths/edit" do
  before(:each) do
    @node_path = assign(:node_path, stub_model(NodePath))
  end

  it "renders the edit node_path form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => node_paths_path(@node_path), :method => "post" do
    end
  end
end
