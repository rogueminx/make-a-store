class ProductsController < ApplicationController
  def index
    @recent_products = Product.all
    @reviewed_products = Product.most_reviews
  end
end
