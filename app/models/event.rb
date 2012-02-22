class Event < ActiveRecord::Base
  belongs_to :user
  has_many :borrowers
  has_many :attendees
  
  validates_presence_of :name, :start_date, :end_date, :user_id
  validates_uniqueness_of :name
  
  def is_admin?(user)
    user == self.user
  end
  
  def is_general?
    self.name == "Privileges"
  end   
end
