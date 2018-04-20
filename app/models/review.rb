class Review < ActiveRecord::Base
  validates :rating, :presence => true
  validates :author, :presence => true
  validates :description, :presence => true
end
