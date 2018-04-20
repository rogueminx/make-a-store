class Product < ActiveRecord::Base
  validates :name, :presence => true
  validates :origin, :presence => true
  validates :variety, :presence => true
  validates :notes, :presence => true
  validates :price, :presence => true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 500 }
end
