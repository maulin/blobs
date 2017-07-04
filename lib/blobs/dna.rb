class Dna
  attr_accessor :genes

  def initialize
    self.genes = {}
    Gene.descendants.each do |gene|
      genes[gene.name.downcase.to_sym] = gene.new
    end
  end

  def to_s
    genes.inject({}) do |memo, (k, v)|
      memo[k] = v.to_s
      memo
    end
  end
end
