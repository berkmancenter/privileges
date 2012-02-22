class Attendee < ActiveRecord::Base
  belongs_to :event
  
  validates_presence_of :firstname, :lastname, :email, :event
end
