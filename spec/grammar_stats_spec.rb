require 'grammar_stats'

RSpec.describe GrammarStats do
  context "it returns correct boolean / error" do
    it "fails for non-string" do
      stats = GrammarStats.new
      expect { stats.check(["string"]) }.to raise_error "text needs to be a string"
    end

    it 'returns true for capital at the beginning' do
      stats = GrammarStats.new
      expect(stats.check("String.")).to eq true
    end

    it 'returns false for non-capital at the beginning' do
      stats = GrammarStats.new
      expect(stats.check("string!")).to eq false
    end

    it 'returns true for puncuation at end' do
      stats = GrammarStats.new
      expect(stats.check("String.")).to eq true
    end

    it 'returns false for lack of punctuation at end' do
      stats = GrammarStats.new
      expect(stats.check("String")).to eq false
    end
  end

  context "percentage of passed texts" do
    it "returns 20% of passed texts for 1 pass out of 5 texts" do
      stats = GrammarStats.new
      stats.check("Banana!")
      stats.check("apple?")
      stats.check("pear!")
      stats.check("Strawberry")
      stats.check("POTATO")
      result = stats.percentage_good
      expect(result).to eq 20
    end

    it "returns 0% of passed texts for 0 pass out of 2 texts" do
      stats = GrammarStats.new
      stats.check("hello!!!!")
      stats.check("Hiya")
      result = stats.percentage_good
      expect(result).to eq 0
    end
  end
end