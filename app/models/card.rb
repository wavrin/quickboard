class Card < ActiveRecord::Base
  belongs_to :board
  before_save :default_values  
  POSITION = %w(backlog doing done)
  
  private
  
  def default_values
    self.position ||= "backlog"
  end
end
