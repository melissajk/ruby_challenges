class Cipher
  attr_reader :key

  LETTERS = ('a'..'z').to_a

  def initialize(key=generate_rand_key)
    @key = verify_alpha(key)
  end
  
  def encode(text)
    text.chars.map.with_index do |char, index|
      new_index = (LETTERS.find_index(char) + shift_values[index]) % 26
      LETTERS[new_index]
    end.join
  end
  
  def decode(text)
    text.chars.map.with_index do |char, index|
      new_index = (LETTERS.find_index(char) - shift_values[index]) % 26
      LETTERS[new_index]
    end.join
  end

  private
  
  def shift_values
    @key.chars.map { |char| LETTERS.find_index(char) }
  end
  
  def verify_alpha(key)
    raise ArgumentError, "Key must be lower-case letters" unless key.match(/\A[a-z]+\z/)
    key
  end
  
  def generate_rand_key
    Array.new(100) { LETTERS.sample }.join
  end
end
