require_relative "../lib/kid_on_steps"

#child can choose to hop 1,2, or 3 steps each time.
# how many permutations for N steps
describe "step_permutations" do
  it "is 1 for 0" do
    expect(step_permutations(0)).to eq(1)
  end

  it "only has 1 way for 1" do
    expect(step_permutations(1)).to eq(1)
  end

  it "has 2 ways for 2" do
    expect(step_permutations(2)).to eq(2)
  end

  it "is 4 for 3" do
    expect(step_permutations(3)).to eq(4)
  end

  it "sums the lesser 3 for 4" do
    expect(step_permutations(4)).to eq(7)
  end
end
