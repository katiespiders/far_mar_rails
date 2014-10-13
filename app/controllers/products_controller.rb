class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to "/vendors/#{@product.vendor_id}"
    else
      render :new
    end
  end

  def edit
    find_product
  end

  def show
    find_product
    @sales = Sale.where("product_id='#{@product.id}'")
    @vendor = Vendor.find(@product.vendor_id)
  end

  def update
    find_product
    @product.update(params.permit(:name, :description, :price))
    if @product.save
      redirect_to "/products/#{@product.id}"
    else
      render :edit
    end
  end

  def delete
    find_product
    @product.destroy
    redirect_to "/products"
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :vendor_id)
  end

  def find_product
    @product = Product.find(params["id"])
  end
end
