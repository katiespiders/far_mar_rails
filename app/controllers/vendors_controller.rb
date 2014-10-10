class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to "/vendors/#{@vendor.id}"
    else
      render :new
    end
  end

  def show
    # if params[:session]
    #   puts "session:", params[:session]
    #   @loggedin = true
    # end
    # puts params
    find_vendor
    @market = @vendor.market_id ? Market.find(@vendor.market_id) : nil
  end

  def edit
    find_vendor
  end

  def update
    find_vendor
    @vendor.update(vendor_params)
    if @vendor.save
      redirect_to "/vendors/#{@vendor.id}"
    else
      render :edit
    end
  end

  def delete
    find_vendor
    products = Product.where(vendor_id: @vendor.id)
    products.each { |product| product.destroy }
    @vendor.destroy
    redirect_to "/vendors"
  end

  # this is what rails magic does
  def login
    render :login
  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :market_id, :description, :website, :email, :phone)
  end

  def find_vendor
    @vendor = Vendor.find(params[:id])
  end
end
