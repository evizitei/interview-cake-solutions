require_relative "../lib/all_but_index_product"

describe "get_products_of_all_ints_except_at_index" do
  it "maps products without the current index" do
    input =   [1, 7, 3, 4]
    output = get_products_of_all_ints_except_at_index(input)
    expect(output).to eq([84, 12, 28, 21])
  end

  it 'handles input arrays with 0s' do
    input =   [1, 7, 3, 4, 0]
    output = get_products_of_all_ints_except_at_index(input)
    expect(output).to eq([0, 0, 0, 0, (4*3*7*1)])
  end
end
