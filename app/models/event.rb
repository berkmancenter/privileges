class Event < ActiveRecord::Base
  belongs_to :user
  has_many :borrowers
  
  validates_presence_of :name, :start_date, :user_id
  
  def is_admin?(user)
    user == self.user
  end  
end
