class HeatResistance < Gene
  def initialize
    self.value = [*0..3].sample
  end

  def name
    "HER"
  end
end

