class MarketsController < ApplicationController
  def new
    @market = Market.new
  end

  def index
    @markets = Market.all
  end

  def create
    @market = Market.new(params.require(:market).permit(:name, :street_address, :city, :state, :zipcode))
    redirect_to "/markets"
  end
end
