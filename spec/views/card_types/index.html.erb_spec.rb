require 'spec_helper'

describe "card_types/index" do
  before(:each) do
    assign(:card_types, [
      stub_model(CardType),
      stub_model(CardType)
    ])
  end

  it "renders a list of card_types" do
    render
  end
end
