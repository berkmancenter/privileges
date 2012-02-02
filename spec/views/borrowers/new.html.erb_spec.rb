require 'spec_helper'

describe "borrowers/new" do
  before(:each) do
    assign(:borrower, stub_model(Borrower).as_new_record)
  end

  it "renders new borrower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => borrowers_path, :method => "post" do
    end
  end
end
