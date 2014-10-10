class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit(:id, :name, :market_id, :description, :website, :email, :phone))
    if @vendor.save
      redirect_to "/vendors/#{@vendor.id}"
    else
      render :new
    end
  end

  def show
    if params[:session]
      puts "session:", params[:session]
      @loggedin = true
    end
    puts params
    @vendor = Vendor.find(params[:id])
    # puts Market.all
    # if Market.where(@vendor.market_id)
    #   @market = Market.find(@vendor.market_id)
    # else
    #   @market = nil
    # end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:vendor][:id])
    @vendor.update(params.require(:vendor).permit(:name, :market_id, :description, :website, :email, :phone))
    if @vendor.save
      redirect_to "/vendors/#{@vendor.id}"
    else
      render :edit
    end
  end

  # this is what rails magic does
  def login
    render :login
  end

end
