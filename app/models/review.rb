class Review < ActiveRecord::Base
  validates :rating, :presence => true
  validates :author, :presence => true
  validates :description, :presence => true
  validates_length_of :description, :minimum => 50, :maximum => 250
  before_save :convert_to_integer
  validates_inclusion_of :rating, :in => 1..5


private
  def convert_to_integer
    self.rating = rating.to_i
  end
end
