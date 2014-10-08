class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(params.require(:product).permit!)
    redirect_to "product/"
  end
end
