class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def index
    @vendors = Vendor.all
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit!)
    redirect_to "vendor/"
  end
end
