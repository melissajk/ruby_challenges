class InvalidCodonError < TypeError ; end

class Translation
  PROTEIN_TO_CODON = { "Methionine"    => ['AUG'],
                       "Phenylalanine" => ['UUU', 'UUC'],
                       "Leucine"       => ['UUA', 'UUG'],
                       "Serine"        => ['UCU', 'UCC', 'UCA', 'UCG'],
                       "Tyrosine"      => ['UAU', 'UAC'],
                       "Cysteine"      => ['UGU', 'UGC'],
                       "Tryptophan"    => ['UGG'],
                       "STOP"          => ['UAA', 'UAG', 'UGA']
    }
  
  def self.of_codon(codon)
    PROTEIN_TO_CODON.select { |protein, codons| codons.include?(codon) }.keys.first
  end
  
  def self.of_rna(strand)
    raise InvalidCodonError, "Invalid RNA Strand" unless strand =~ /\A[UAGC]+\z/
    codons = []
    strand.chars.each_slice(3) { |chars| codons << chars.join }
    codons.take_while { |codon| of_codon(codon) != 'STOP'}
          .map { |codon| of_codon(codon) }
  end
end