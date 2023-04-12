class GrammarStats
  def initialize
    # ...
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    fail "text needs to be a string" unless text.is_a? String
    capital = text[0] == text[0].upcase
    punctuation = text[-1].match?(/[.?!]/)
    return capital && punctuation
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end