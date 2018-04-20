require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :origin }
  it { should validate_presence_of :variety }
  it { should validate_presence_of :notes }
  it { should validate_presence_of :price }
end
