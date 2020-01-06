
class StocksController < ApplicationController


  def form

  end



  def do_lookup

    #string that comes from from
    @symbol = params[:stock_symbol]

    #intilalise api
    StockQuote::Stock.new(api_key: 'pk_16a849fd637243a79fff90fa4d42bc5d')

    #pass in the string from form and search api
    stock = StockQuote::Stock.quote( @symbol )

    # binding.pry

    @price = stock.latest_price
    @company = stock.company_name

  end

end
