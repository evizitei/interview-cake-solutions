# iterating one time, should be O(n) runtime
# allocating one array of 3 values, O(1) additional memory in excess of input
def highest_product(array)
  big_3 = [0,0,0]
  big_negative_2 = [0,0]
  array.each do |int|
    if int < 0
      lowest = big_negative_2.max
      if int < lowest
        big_negative_2 << int
        big_negative_2.sort!.pop
      end
    else
      lowest = big_3.min
      if int > lowest
        big_3 << int
        big_3.sort!.shift
      end
    end
  end

  if big_negative_2.size > 1 && big_negative_2.reduce(:*) > (big_3[0] * big_3[1])
    (big_negative_2 << big_3.max).reduce(:*)
  else
    big_3.reduce(:*)
  end
end
