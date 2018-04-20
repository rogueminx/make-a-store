require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit new_product_path
    fill_in 'Name', :with => 'Monkey Butts'
    fill_in 'Origin', :with => 'USA'
    fill_in 'Variety', :with => 'Organic'
    fill_in 'Notes', :with => 'Crappy, earthy'
    fill_in 'Price', :with => '48.22'
    click_on 'Create Product'
    expect(page).to have_content 'Monkey Butts'
  end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
