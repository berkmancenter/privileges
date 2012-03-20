class Affiliation < ActiveRecord::Base
  has_and_belongs_to_many :borrowers
  
  validates_presence_of :name, :rank, :message
  validates_uniqueness_of :name, :rank
end
