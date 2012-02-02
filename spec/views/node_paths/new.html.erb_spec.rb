require 'spec_helper'

describe "node_paths/new" do
  before(:each) do
    assign(:node_path, stub_model(NodePath).as_new_record)
  end

  it "renders new node_path form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => node_paths_path, :method => "post" do
    end
  end
end
