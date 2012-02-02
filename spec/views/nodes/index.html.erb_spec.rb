require 'spec_helper'

describe "nodes/index" do
  before(:each) do
    assign(:nodes, [
      stub_model(Node),
      stub_model(Node)
    ])
  end

  it "renders a list of nodes" do
    render
  end
end
