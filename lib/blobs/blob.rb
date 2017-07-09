class Blob
  TYPES = ['blue', 'pink']
  SIZE = 20
  AREA = 200

  attr_accessor :dna, :type, :x, :y, :location, :top_left, :top

  def initialize(type = nil, x, y)
    self.x = x
    self.y = y
    self.location = [x, y]
    self.top_left = [x - SIZE, y - SIZE]
    self.top = [x, y - SIZE]
    self.type = type || TYPES.sample
    self.dna = Dna.new
  end

  def draw
    Gosu.draw_triangle(
      *location, Gosu::Color::RED,
      *top, Gosu::Color::RED,
      *top_left, Gosu::Color::RED
    )
  end
end
