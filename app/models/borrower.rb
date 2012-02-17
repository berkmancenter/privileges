class Borrower < ActiveRecord::Base
  belongs_to :event
  belongs_to :card_type
  
  validates_presence_of :firstname, :lastname, :email, :phone, :event, :start_date, :end_date
  validates_uniqueness_of :email, :phone
end
