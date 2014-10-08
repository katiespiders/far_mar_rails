class ProductsController < ApplicationController

  def create
    @product = Product.new(params.permit(:name, :description, :price, :vendor_id)) # the 'require' part of this syntax refers to the key of a nested hash; it is left out here because the params from the raw html form are not in a nested hash
    # price comes in as an integer w/ cents dropped--already lost before I do to_f, and type="number" step="any" doesn't work
    # how to fix this without asking user to enter price in cents?
    # @product.price.to_f
    # @product.price *= 100
    # puts @product.price
    if @product.save
      redirect_to "/vendors/#{@product.vendor_id}"
    else
      # I want to render vendors/add_product because that's where the form is, how do I get to it?
    end
  end
end
