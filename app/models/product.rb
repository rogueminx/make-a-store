class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :origin, :presence => true
  validates :variety, :presence => true
  validates :notes, :presence => true
  validates :price, :presence => true
end
