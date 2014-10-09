class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.permit(:name, :description, :price, :vendor_id)) # the 'require' part of this syntax refers to the key of a nested hash; it is left out here because the params from the raw html form are not in a nested hash
    if @product.save
      redirect_to "/vendors/#{@product.vendor_id}"
    else
      # I want to render vendors/add_product because that's where the form is, how do I get to it from products controller? or should I be doing this all from the vendors controller? probably...
    end
  end

  def edit
    @product = Product.find(params.permit(:id)["id"])
  end

  def update
    @product = Product.find(params.permit(:id)["id"])
    @product.update(params.permit(:name, :description, :price))
    if @product.save
      redirect_to "/products/#{@product.id}"
    else
      render :edit
    end
  end

  def destroy
    Product.destroy(params.permit(:id)["id"])
    redirect_to "/products"
  end
end
