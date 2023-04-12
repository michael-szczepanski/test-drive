require 'diary_entry'

RSpec.describe DiaryEntry do
  it "checks that the title is returned" do
    diary = DiaryEntry.new("My Life", "Learning how to code")
    result = diary.title
    expect(result).to eq "My Life"
  end

  context "non-string set as content" do
    it "fails" do
      diary = DiaryEntry.new("My Life", 0)
      expect { diary.contents }.to raise_error "Contents needs to be a string"
    end
    it "return contents of DiaryEntry" do
      diary = DiaryEntry.new("My Life", "Learning how to code")
      result = diary.contents
      expect(result).to eq("Learning how to code")
    end
  end
end
