require 'spec_helper'

describe "borrowers/show" do
  before(:each) do
    @borrower = assign(:borrower, stub_model(Borrower))
  end

  it "renders attributes in <p>" do
    render
  end
end
