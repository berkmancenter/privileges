require 'spec_helper'

describe "nodes/show" do
  before(:each) do
    @node = assign(:node, stub_model(Node))
  end

  it "renders attributes in <p>" do
    render
  end
end
