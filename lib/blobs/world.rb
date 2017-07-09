class World
  attr_accessor :blobs, :grid

  def initialize(width, height)
    init_blobs
    init_grid(width, height)
  end

  def init_blobs
    @blobs = []
    Blob::TYPES.each do |type|
      @blobs.push(Blob.new(type))
    end
  end

  def init_grid(width, height)
    self.grid = []
    rows = squares_per_row = width / Square::SIZE
    rows.times do |i|
      i = i * Square::SIZE
      squares_per_row.times do |j|
        square = Square.new(i, j * Square::SIZE)
        grid.push(square)
      end
    end
  end

  def draw_map
    self.grid.each do |square|
      square.draw
    end
  end
end
