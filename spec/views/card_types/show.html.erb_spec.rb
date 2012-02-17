require 'spec_helper'

describe "card_types/show" do
  before(:each) do
    @card_type = assign(:card_type, stub_model(CardType))
  end

  it "renders attributes in <p>" do
    render
  end
end
