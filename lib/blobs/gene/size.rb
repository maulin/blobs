class Size < Gene
  def initialize
    self.value = [*1..3].sample
  end
end
