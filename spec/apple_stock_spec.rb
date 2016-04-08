require_relative "../lib/apple_stock"

describe "Apple Stock" do
  it "identifies the best profit possible from an array of prices over a day" do
    stock_prices_yesterday = [10, 7, 5, 8, 11, 9]
    profit = AppleStock.get_max_profit(stock_prices_yesterday)
    expect(profit).to eq(6)
  end

  it "identifies the least bad buy sell for negative all day" do
    stock_prices_yesterday = [10, 7, 5, 4, 3, 2]
    profit = AppleStock.get_max_profit(stock_prices_yesterday)
    expect(profit).to eq(-1)
  end
end
