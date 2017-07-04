class Gene
  attr_accessor :value

  def to_s
    value
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
