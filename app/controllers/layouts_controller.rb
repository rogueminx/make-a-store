class LayoutsController < ApplicationController
  

  def index
    @recent_products = Product.recently_added
    @reviewed_products = Product.most_reviews
    @costa_rica_products = Product.from_costa_rica
  end
end
