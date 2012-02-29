require 'spec_helper'

describe "collections/index" do
  before(:each) do
    assign(:collections, [
      stub_model(Collection),
      stub_model(Collection)
    ])
  end

  it "renders a list of collections" do
    render
  end
end
