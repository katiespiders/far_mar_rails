class ProductsController < ApplicationController

  def create
    @product = Product.new(params.permit(:name, :description, :price, :vendor_id)) # the 'require' part of this syntax refers to the key of a nested hash; it is left out here because the params from the raw html form are not in a nested hash
    if @product.save
      redirect_to "/vendors/#{@product.vendor_id}"
    end
  end
end
