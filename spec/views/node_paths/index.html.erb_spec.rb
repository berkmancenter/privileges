require 'spec_helper'

describe "node_paths/index" do
  before(:each) do
    assign(:node_paths, [
      stub_model(NodePath),
      stub_model(NodePath)
    ])
  end

  it "renders a list of node_paths" do
    render
  end
end
