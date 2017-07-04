class Blob
  TYPES = ['blue', 'pink']

  attr_accessor :dna, :type

  def initialize(type = nil)
    self.type = type || TYPES.sample
    self.dna = Dna.new
  end

  def genome
    {
      :type => type,
      :dna => dna.to_s
    }
  end
end
