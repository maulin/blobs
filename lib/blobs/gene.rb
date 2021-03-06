class Gene
  attr_accessor :value

  def name
    raise 'implement in subclass'
  end

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end
