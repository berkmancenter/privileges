require 'spec_helper'

describe "nodes/new" do
  before(:each) do
    assign(:node, stub_model(Node).as_new_record)
  end

  it "renders new node form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nodes_path, :method => "post" do
    end
  end
end
