class ProductsController < ApplicationController
  def index
    @recent_products = Product.recently_added
    @reviewed_products = Product.most_reviews
  end
end
