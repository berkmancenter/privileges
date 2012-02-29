require 'spec_helper'

describe "collections/show" do
  before(:each) do
    @collection = assign(:collection, stub_model(Collection))
  end

  it "renders attributes in <p>" do
    render
  end
end
