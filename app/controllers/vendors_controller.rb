class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      session[:vendor_id] ||= @vendor.id
      redirect_to "/vendors/#{@vendor.id}"
    else
      render :new
    end
  end

  def show
    if session[:vendor_id]
      puts "session:", session
      @loggedin = true
    end
    find_vendor
    @market = @vendor.market_id ? Market.find(@vendor.market_id) : nil
  end

  def edit
    find_vendor
  end

  def sales
    find_vendor
    @sales = []
    @products = Product.where(vendor_id: @vendor.id).each do |product|
      @sales += Sale.where(product_id: product.id)
    end
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
    session[:vendor_id] = nil
    @vendor.destroy
    redirect_to "/vendors"
  end

  def login
    find_vendor
    session[:vendor_id] ||= @vendor.id
    redirect_to "/vendors/#{@vendor.id}"
  end

  def logout
    session[:vendor_id] = nil
    redirect_to "/"
  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :market_id, :description, :website, :email, :phone)
  end

  def find_vendor
    @vendor = Vendor.find(params[:id])
  end
end
