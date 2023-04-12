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
end