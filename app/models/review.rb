class Review < ActiveRecord::Base
  validates :rating, :presence => true
  validates :author, :presence => true
  validates :description, :presence => true
  validates_length_of :description, :minimum => 50, :maximum => 250
end
