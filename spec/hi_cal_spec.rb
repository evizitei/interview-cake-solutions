require_relative "../lib/hi_cal"

# condense a list of times where a meeting is happening,
# where each integer represents "30 minute blocks since 9am"
describe "condense_meeting_times" do
  it "pulls together overlapping ranges" do
    team_meetings = [ [0, 1], [3, 5], [4, 8], [10, 12], [9, 10] ]
    meeting_blocks = condense_meeting_times(team_meetings)
    expect(meeting_blocks).to eq(  [ [0, 1], [3, 8], [9, 12] ])
  end

  it "merges touching meetings" do
    meetings = [ [1, 2], [2, 3] ]
    meeting_blocks = condense_meeting_times(meetings)
    expect(meeting_blocks).to eq(  [ [1, 3]])
  end

  it "merges fully overlapping meetings" do
    meetings =   [ [1, 5], [2, 3] ]
    meeting_blocks = condense_meeting_times(meetings)
    expect(meeting_blocks).to eq(  [ [1, 5]])
  end

  it "can merge everything into one block" do
    meetings =   [ [1, 10], [2, 6], [3, 5], [7, 9] ]
    meeting_blocks = condense_meeting_times(meetings)
    expect(meeting_blocks).to eq(  [ [1, 10]])
  end
end
