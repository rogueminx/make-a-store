class ProductsController < ApplicationController
  def index
    if params[:search_term]
      @products = Product.searched_products(params[:search_term])
      @search_term = params[:search_term]
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
    @search_term =
    render :display
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Congratulations! Your #{@product.name} was added to the product list"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update!(product_params)
      flash[:notice] = "Good job! Your product was updated!"
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :origin, :variety, :notes, :price, :featured, :search_term)
  end
end
