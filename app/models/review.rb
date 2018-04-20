class Review < ActiveRecord::Base
  belongs_to :product

  validates :rating, :presence => true
  validates :author, :presence => true
  validates :description, :presence => true
  validates_length_of :description, :minimum => 50, :maximum => 250
  before_save :convert_to_integer
  validates_inclusion_of :rating, :in => 1..5
  before_save :titleize_author


private
  def convert_to_integer
    self.rating = rating.to_i
  end

  def titleize_author
    self.author = self.author.titleize
  end
end
