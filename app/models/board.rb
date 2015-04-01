class Board < ActiveRecord::Base
  has_many :cards
  accepts_nested_attributes_for :cards
  
  before_validation :generate_slug

  def to_param
    slug
  end
  
  def generate_slug
    self.slug ||= SecureRandom.base64(8) if name
  end
end
