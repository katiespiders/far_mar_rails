class MarketController < ApplicationController


  def new
    @market = Market.new
  end

  def index
    @markets = Market.all.sort_by {|market| market.name}
  end

  def create
    @market = Market.create(req_per_params)
    if session[:vendor_id]
      Vendor.update(session[:vendor_id], market_id: @market.id)

      puts "*"*80, @vendor.inspect, @market.id, "&"*80
    end
    redirect_to "/markets/#{@market.id}"
  end

  def edit
    find_market
  end

  def show
    find_market
  end

  def update
    find_market
    @market.update(req_per_params)
    redirect_to "/markets/#{@market.id}"
  end

  def delete
    find_market
    @market.destroy
    redirect_to "/markets"
  end

  private

  def req_per_params
    params.require(:market).permit(:name, :street_address, :city, :state, :zipcode)
  end

  def find_market
    @market = Market.find(params[:id])
  end

end
