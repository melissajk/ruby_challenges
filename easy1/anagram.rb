# words is an array of possible anagrams
# anagram.size == word.size
# word and anagram = case INsensitive
# return value is an array of matching anagrams


# class Anagram
#   def initialize(word)
#     @word = word.downcase
#   end
  
#   def match(anagrams)
#     anagrams.select do |anagram|
#       anagram.downcase != @word &&
#       anagram.downcase.chars.sort == @word.chars.sort
#     end
#   end
# end

# solve this without #sort
class Anagram
  def initialize(word)
    @word = word.downcase
  end
  
  def match(anagrams)
    anagrams.select { |anagram| anagram?(anagram, @word) }
  end
  
  def anagram?(anagram, word)
    anagram.downcase != word &&
    letter_hash(anagram) == letter_hash(word)
  end
  
  def letter_hash(word)
    result = {}
    word.downcase.chars.each do |char|
      if result.has_key?(char)
        result[char] += 1
      else
        result[char] = 1
      end
    end
    result
  end
end


