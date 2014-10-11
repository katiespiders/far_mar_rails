class SaleController < ApplicationController

  def new
    @product = product
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(params.require(:sale).permit(:number_sold, :id, :cost, :product_id))
    product
    redirect_to "/sales/#{@sale.id}"
  end

  def show
    @sale = Sale.find(params[:id])
  end

  private
  def vendor
    @vendor = Vendor.find(params[:sale][:vendor_id])
  end

  def product
    @product = Product.find(params[:sale][:product_id])
  end


end
