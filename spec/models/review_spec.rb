require 'rails_helper'

describe Review do
  it { should validate_presence_of :rating }
  it { should validate_presence_of :author }
  it { should validate_presence_of :description }

  it("validates length of description is between 50 and 250 charachters") do
    review = Review.new({:rating => 3, :author => "Amy", :description => "a".*(25)})
    expect(review.save()).to(eq(false))
  end

  it("validates length of description is between 50 and 250 charachters") do
    review = Review.new({:rating => 3, :author => "Amy", :description => "a".*(150)})
    expect(review.save()).to(eq(true))
  end
end
