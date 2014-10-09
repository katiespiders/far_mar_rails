class MarketController < ApplicationController


  def new
    @market = Market.new
  end

  def index
    @markets = Market.all
  end

  def create
    @market = Market.create(params.require(:market).permit(:name, :street_address, :city, :state, :zipcode))
    redirect_to "/markets/show/#{@market.id}"
  end

  def edit
    @market = Market.find(params[:id])
  end

  def show
    @market = Market.find(params[:id])
  end

end
