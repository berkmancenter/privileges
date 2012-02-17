require 'spec_helper'

describe "card_types/edit" do
  before(:each) do
    @card_type = assign(:card_type, stub_model(CardType))
  end

  it "renders the edit card_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => card_types_path(@card_type), :method => "post" do
    end
  end
end
