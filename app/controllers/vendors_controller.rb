class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params.permit(:name, :market_id, :description, :website, :email, :phone))
    if @vendor.save
      redirect_to "/vendors/#{@vendor.id}"
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(params.permit(:name, :market_id, :description, :website, :email, :phone))
    if @vendor.save
      redirect_to "/vendors/#{@vendor.id}"
    else
      render :edit
    end
  end
end
