class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
  end

  def title
    fail "Title needs to be a string" unless @title.is_a? String
    return @title
  end

  def contents
    # Returns the contents as a string
    fail "Contents needs to be a string" unless @contents.instance_of? String

    return @contents
  end

  def count_words
    return @contents.split(" ").length
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    fail "wpm needs to be an integer" unless wpm.is_a? Integer
    return self.count_words / wpm
  end

  def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                  # of words the user can read per minute
                                  # `minutes` is an integer representing the
                                  # number of minutes the user has to read
    # Returns a string with a chunk of the contents that the user could read
    # in the given number of minutes.
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
    
    fail "wpm and minutes need to be integers" unless wpm.is_a? Integer
    fail "wpm and minutes need to be integers" unless minutes.is_a? Integer

    words = @contents.split(" ")
    chunk_size = wpm * minutes
    return words.slice(0...chunk_size).join(" ")
  end
end