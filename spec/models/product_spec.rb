require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :origin }
  it { should validate_presence_of :variety }
  it { should validate_presence_of :notes }
  it { should validate_presence_of :price }

  it("validates format of price is less than $500 and has two decimal places") do
    product = Product.new({:name => "Coffee", :origin => "Guatemala", :variety => "Single Origin", :notes => "Very yummy coffee notes.", :price => "22.232"})
    expect(product.save()).to(eq(false))
  end

  it("validates format of price is less than $500 and has two decimal places") do
    product = Product.new({:name => "Coffee", :origin => "Guatemala", :variety => "Single Origin", :notes => "Very yummy coffee notes.", :price => "54.10"})
    expect(product.save()).to(eq(true))
  end

  it("will titleize name, origin and variety before saving") do
    product = Product.create({:name => "coffee", :origin => "guatemala", :variety => "single Origin", :notes => "Very yummy coffee notes.", :price => "54.10"})
    expect(product.name()).to(eq("Coffee"))
    expect(product.origin()).to(eq("Guatemala"))
    expect(product.variety()).to(eq("Single Origin"))
  end
end
