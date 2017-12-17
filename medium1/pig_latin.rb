
class PigLatin
  LAST_SOUND        = 'ay'
  BEGIN_VOWEL_SOUND = /\A([xy][^aeiou]|[aeiou])/
  BEGIN_QU          = /\A([^aeiou]*qu)/

  def self.translate(phrase)
    phrase.split(' ').map do |word|
      if word =~ BEGIN_VOWEL_SOUND
        return word + LAST_SOUND
      elsif word =~ BEGIN_QU
        vowel_index = word.start_with?('q') ? 2 : 3
      else
        vowel_index = word.index(/[aeiou]/)
      end
      word[vowel_index..-1] + word[0...vowel_index] + LAST_SOUND
    end.join(' ')
  end
end


# Alternative Solution

# class PigLatin
  
  # def self.translate(phrase)
  #   phrase.split.map! do |word|
  #     return word + LAST_SOUND if word.match(/^yt|^xr|^[aeiou]/)
  #     first_sound = []
  #     word.chars.each do |char|
  #       break if char =~ /[aeiou]/
  #       if char =~ /q/
  #         first_sound.concat(['q','u'])
  #       else
  #         first_sound << char
  #       end
  #     end
  #     word[first_sound.size..-1] + first_sound.join + LAST_SOUND
  #   end
  #   .join(' ')
  # end
# end