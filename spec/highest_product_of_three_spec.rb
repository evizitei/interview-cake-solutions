require_relative "../lib/highest_product_of_three"

describe "get_products_of_all_ints_except_at_index" do
  it "picks the best product" do
    input =   [1, 7, 3, 4,9,2]
    output = highest_product(input)
    expect(output).to eq(9*7*4)
  end

  it "deals with negative numbers" do
    input = [(-10),(-10),1,3,2]
    output = highest_product(input)
    expect(output).to eq(300)
  end

  it "doesnt care if the biggest negative is last" do
    input = [1, 10, (-5), 1, (-100)]
    output = highest_product(input)
    expect(output).to eq(5000)
  end
end
