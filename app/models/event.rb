class Event < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :borrowers
  has_many :attendees
  
  validates_presence_of :name, :start_date, :end_date
  validates_uniqueness_of :name
  
  def is_admin?(user)
    self.users.include?(user)
  end
  
  def is_general?
    self.name == "Privileges"
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['lower(name) LIKE ?', "%#{search}%"])
    end
  end
end
