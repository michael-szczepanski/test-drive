require 'diary_entry'

RSpec.describe DiaryEntry do
  it "checks that the title is returned" do
    diary = DiaryEntry.new("My Life", "Learning how to code")
    result = diary.title
    expect(result).to eq "My Life"
  end
end
