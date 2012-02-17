require 'spec_helper'

describe "card_types/new" do
  before(:each) do
    assign(:card_type, stub_model(CardType).as_new_record)
  end

  it "renders new card_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => card_types_path, :method => "post" do
    end
  end
end
