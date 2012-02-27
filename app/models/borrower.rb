class Borrower < ActiveRecord::Base
  belongs_to :event
  belongs_to :card_type
  
  validates_presence_of :firstname, :lastname, :email, :phone, :event, :start_date, :end_date, :address_1, :city, :state, :zip, :country
  validates_uniqueness_of :email, :phone
  
  def self.search(search)
    if search
      find(:all, :conditions => ['lower(email) LIKE ? or lower(lastname) LIKE ? or lower(firstname) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    end
  end
end
