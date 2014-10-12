class SalesController < ApplicationController

  def new
    @product = product
    @sale = Sale.new
  end

  def create
    @sale = Sale.create(params.require(:sale).permit(:number_sold, :cost, :product_id))
    puts params.inspect
    puts "*"*80
    puts @sale.number_sold
    redirect_to "/sales/#{@sale.id}"
  end

  def show
    @sale = Sale.find(params[:id])
    @product = Product.find(@sale.product_id)
  end

  private
  def vendor
    @vendor = Vendor.find(params[:sale][:vendor_id])
  end

  def product
    @product = Product.find(params[:id])
  end


end
