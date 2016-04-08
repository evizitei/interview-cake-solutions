# Write an efficient function that takes stock_prices_yesterday and
# returns the best profit I could have made from 1 purchase and 1 sale
#of 1 Apple stock yesterday.

# Runtime O(n) (one more iteration for every item added)
# Memory O(1) (we always store one best profit and one lowest price)
class AppleStock
  def self.get_max_profit(prices)
    best_diff = prices[1] - prices[0]
    best_low = prices[0]
    skipped_first = false
    prices.each do |price|
      if !skipped_first
        skipped_first = true
        next
      end

      if price - best_low > best_diff
        best_diff = price - best_low
      end

      if price < best_low
        best_low = price
      end
    end
    return best_diff
  end
end
