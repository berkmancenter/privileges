require 'spec_helper'

describe "affiliations/index" do
  before(:each) do
    assign(:affiliations, [
      stub_model(Affiliation),
      stub_model(Affiliation)
    ])
  end

  it "renders a list of affiliations" do
    render
  end
end
