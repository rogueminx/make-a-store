class Review < ActiveRecord::Base
  belongs_to :product

  before_save :titleize_and_convert
  validates :rating, :presence => true
  validates :author, :presence => true
  validates :description, :presence => true
  validates_length_of :description, :minimum => 50, :maximum => 250
  validates_inclusion_of :rating, :in => 1..5


private
  def titleize_and_convert
    self.author = self.author.titleize
    self.rating = rating.to_i
  end
end
