class Borrower < ActiveRecord::Base
  belongs_to :event
  belongs_to :card_type
  
  validates_presence_of :firstname, :lastname, :email, :event
  validates_uniqueness_of :email
end
