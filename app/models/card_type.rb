class CardType < ActiveRecord::Base
  has_many :borrowers
  
  validates_presence_of :name
  validates_uniqueness_of :name
end
