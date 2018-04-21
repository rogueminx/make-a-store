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

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      flash[:notice] = "Your product was updated!"
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product_id = @review.product_id
    @review.destroy
    redirect_to product_path(@product_id)
  end


private
  def review_params
    params.require(:review).permit(:author, :rating, :description)
  end

end
