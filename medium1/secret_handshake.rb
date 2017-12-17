# if int ==> int.to_s(2)
# if string ==> leave as binary
# invalid binary ==> 0

# if binary ==> int
# divide by 10, 100, 1000.... separate out the different bin #s that compose bin#
# convert compostion #'s ==> array of secret handshake
# hash[binary#] => action
# What if the binary # is larger than 5 chars?


class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']
  
  def initialize(number)
    @binary_string = number.class == String ? verify_binary(number) : number.to_s(2)
  end
  
  def commands
    events = []
    
    return events if @binary_string == 0
    binary_chars = @binary_string.chars.reverse
    reverse_events = binary_chars.pop if binary_chars.size > 4
    
    COMMANDS.each_with_index do |command, index|
      events << command if binary_chars[index] == '1'
    end
    reverse_events == '1' ? events.reverse : events
  end
  
  private
  
  def verify_binary(number)
    return 0 unless number =~ /\A(1|0)+\z/
    number
  end
end