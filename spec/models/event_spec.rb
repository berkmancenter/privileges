require 'spec_helper'
require 'shoulda/integrations/rspec2'

describe Event do
  # [:name, :start_date, :end_date].each do|col|
  #     it { should validate_presence_of(col) }
  #   end
  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }
  it { should have_many(:borrowers) }
  
  it "can be instantiated" do
    Event.new.should be_an_instance_of(Event)
  end

  it "can be saved successfully" do
    Event.create.should be_persisted
  end
end