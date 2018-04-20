class ProductsController < ApplicationController
  def index
    @recent_products = Product.recently_added
    @reviewed_products = Product.most_reviews
  end

  def show
    @product = Product.find(params[:id])
    render :display
  end
end
