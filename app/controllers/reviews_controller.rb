class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Thanks, your review is has been added to the list!"
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:author, :rating, :description)
  end

end
