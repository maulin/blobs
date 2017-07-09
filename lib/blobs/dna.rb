class Dna
  attr_accessor :genes

  def initialize
    self.genes = {}
    Gene.descendants.each do |klass|
      gene = klass.new
      genes[gene.name] = gene
    end
  end
end
