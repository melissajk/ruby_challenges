# string.split(/\s|,/)  --> delete or disregard spaces
# string.downcase (not case sensitive)
# numbers count as words

class Phrase

  def initialize(phrase)
    @words = phrase
  end
  
  def prepare_words_for_counting
    @words.split(/[\s,]/)
          .select { |item| item.match(/\w/) }
          .map { |item| item.slice(/\b(\d+|\w+'?\w+)\b/).downcase }
  end

  def word_count
    counts = Hash.new(0)
    word_list = prepare_words_for_counting
  
    word_list.each do |word|
      counts[word] += 1
    end
    counts 
  end
end
