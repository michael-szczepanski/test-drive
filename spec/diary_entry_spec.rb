require 'diary_entry'

RSpec.describe DiaryEntry do
  context "title should be a valid string" do
    it "checks that the title is returned" do
      diary = DiaryEntry.new("My Life", "Learning how to code")
      result = diary.title
      expect(result).to eq "My Life"
    end

    it "fails" do
      diary = DiaryEntry.new(["array"], "Learning how to code")
      expect { diary.title }.to raise_error "Title needs to be a string"
    end
  end

  context "non-string set as content" do
    it "fails" do
      diary = DiaryEntry.new("My Life", 0)
      expect { diary.contents }.to raise_error "Contents needs to be a string"
    end
    it "passes: return contents of DiaryEntry" do
      diary = DiaryEntry.new("My Life", "Learning how to code")
      result = diary.contents
      expect(result).to eq("Learning how to code")
    end
  end

  context "count_words should return an integer" do
    it "checks that the right number of words are returned" do
      diary = DiaryEntry.new("My Life", "Learning how to code")
      result = diary.count_words
      expect(result).to eq 4
    end
  end
end
