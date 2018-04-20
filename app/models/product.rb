class Product < ActiveRecord::Base
  has_many :reviews

  validates :name, :presence => true
  validates :origin, :presence => true
  validates :variety, :presence => true
  validates :notes, :presence => true
  validates :price, :presence => true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 500 }
  before_save :titleize_entries

private
  def titleize_entries
    self.name = self.name.titleize
    self.origin = self.origin.titleize
    self.variety = self.variety.titleize
  end
end
