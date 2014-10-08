class ProductsController < ApplicationController

  def create
    puts product_params
    @product = Product.new(product_params)
    @product.save
    # redirect_to @product
  end

  private
  def product_params
    params.require(:product).permit!
  end
end
