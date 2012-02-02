class Event < ActiveRecord::Base
  belongs_to :user
  has_many :borrowers
  
  validates_presence_of :name, :start_date, :end_date
end
