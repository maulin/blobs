class Attack < Gene
  def initialize
    self.value = [*1..3].sample
  end

  def name
    "ATK"
  end
end
