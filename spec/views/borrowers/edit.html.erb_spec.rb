require 'spec_helper'

describe "borrowers/edit" do
  before(:each) do
    @borrower = assign(:borrower, stub_model(Borrower))
  end

  it "renders the edit borrower form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => borrowers_path(@borrower), :method => "post" do
    end
  end
end
