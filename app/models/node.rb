class Node < ActiveRecord::Base
  has_and_belongs_to_many :choices, :class_name => 'Node', :foreign_key => 'choice_id', :join_table => 'choices_nodes'
  
  validates_presence_of :text
  validates_uniqueness_of :text
  
  def is_question?
    self.choices.length > 1
  end  
  
  def is_choice?
    self.choices.length == 1
  end
  
  def is_answer?
    self.choices.length <= 0
  end
end
