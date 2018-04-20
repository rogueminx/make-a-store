require 'rails_helper'

describe Review do
  it { should validate_presence_of :rating }
  it { should validate_presence_of :author }
  it { should validate_presence_of :description }

  it("validates length of description is between 50 and 250 charachters") do
    product = Product.new({:name => "Coffee", :origin => "Guatemala", :variety => "Single Origin", :notes => "Very yummy coffee notes.", :price => "22.32"})
    review = product.reviews.new({:product_id => product.id, :rating => "3", :author => "Amy", :description => "a".*(25)})
    expect(review.save()).to(eq(false))
  end

  it("validates length of description is between 50 and 250 charachters") do
    product = Product.new({:name => "Coffee", :origin => "Guatemala", :variety => "Single Origin", :notes => "Very yummy coffee notes.", :price => "22.32"})
    review = product.reviews.new({:product_id => product.id, :rating => "3", :author => "Amy", :description => "a".*(150)})
    expect(review.save()).to(eq(true))
  end

  it("validates rating is between 1 and 5") do
    product = Product.new({:name => "Coffee", :origin => "Guatemala", :variety => "Single Origin", :notes => "Very yummy coffee notes.", :price => "22.22"})
    review = product.reviews.new({:product_id => product.id, :rating => "7", :author => "Amy", :description => "a".*(150)})
    expect(review.save()).to(eq(false))
  end

  it("validates rating is between 1 and 5") do
    product = Product.new({:name => "Coffee", :origin => "Guatemala", :variety => "Single Origin", :notes => "Very yummy coffee notes.", :price => "22.22"})
    review = product.reviews.new({:product_id => product.id, :rating => "3", :author => "Amy", :description => "a".*(150)})
    expect(review.save()).to(eq(true))
  end

  it("titelizes the name of the author") do
    product = Product.new({:name => "Coffee", :origin => "Guatemala", :variety => "Single Origin", :notes => "Very yummy coffee notes.", :price => "22.22"})
    product.save
    review = product.reviews.new({:product_id => product.id, :rating => "3", :author => "amy brain", :description => "a".*(150)})
    expect(review.author()).to(eq("Amy Brain"))
  end

end
