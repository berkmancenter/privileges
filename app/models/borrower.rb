class Borrower < ActiveRecord::Base
  belongs_to :event
  has_and_belongs_to_many :card_types
  has_and_belongs_to_many :affiliations
  has_and_belongs_to_many :collections
  belongs_to :attendee
  
  validates_presence_of :firstname, :lastname, :email, :phone, :event, :start_date, :end_date, :address_1, :city, :state, :zip, :country
  validates_uniqueness_of :email, :phone
  
  after_save :post_save_hooks
  
  def post_save_hooks
    admin = User.find(:first, :conditions => {:admin => true})
    Email.create(
      :from => admin.email,
      :reply_to => admin.email,
      :to => self.email,
      :subject => "Privileges Request",
      :body => "Your Privileges registration request has been submitted. Thank you."
    )
      
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['lower(email) LIKE ? or lower(lastname) LIKE ? or lower(firstname) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    end
  end
end
