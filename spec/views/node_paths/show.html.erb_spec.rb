require 'spec_helper'

describe "node_paths/show" do
  before(:each) do
    @node_path = assign(:node_path, stub_model(NodePath))
  end

  it "renders attributes in <p>" do
    render
  end
end
