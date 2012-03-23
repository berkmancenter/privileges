require 'spec_helper'

describe "affiliations/show" do
  before(:each) do
    @affiliation = assign(:affiliation, stub_model(Affiliation))
  end

  it "renders attributes in <p>" do
    render
  end
end
