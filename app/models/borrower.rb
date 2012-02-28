class Borrower < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :card_types
  belongs_to :attendee
  
  validates_presence_of :firstname, :lastname, :email, :phone, :event, :start_date, :end_date, :address_1, :city, :state, :zip, :country
  validates_uniqueness_of :email, :phone
  
  def self.search(search)
    if search
      find(:all, :conditions => ['lower(email) LIKE ? or lower(lastname) LIKE ? or lower(firstname) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    end
  end
end
