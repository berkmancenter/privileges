class Attendee < ActiveRecord::Base
  belongs_to :event
  
  validates_presence_of :firstname, :lastname, :email, :event
  
  def self.search(search)
    if search
      find(:all, :conditions => ['lower(email) LIKE ? or lower(lastname) LIKE ? or lower(firstname) LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    end
  end
end
