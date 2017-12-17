class DNA
  INVALID_NUC_ACID = /[^AGTC]/

  def initialize(dna_string1)
    @dna_string = validate_dna(dna_string1.upcase)
  end
  
  def hamming_distance(dna_string2)
    validate_dna(dna_string2)
    dna_string1 = @dna_string
    
    if dna_string2.size > dna_string1.size
      dna_string2 = dna_string2[0, dna_string1.size]
    elsif dna_string1.size > dna_string2.size
      dna_string1 = dna_string1[0, dna_string2.size]
    end
    
    total = 0
    dna_string2.chars.each_with_index do |char, index|
      total += 1 if char != dna_string1.chars[index]
    end
    total
  end

  def validate_dna(dna_string)
    raise ArgumentError, "Invalid DNA string." if dna_string =~ INVALID_NUC_ACID
    dna_string
  end
end