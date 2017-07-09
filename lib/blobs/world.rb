class World
  attr_accessor :blobs, :grid, :selected_blobs

  def initialize(width, height)
    init_grid(width, height)
    init_blobs
    self.selected_blobs = []
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

  def init_blobs
    self.blobs = []
    spawn_location = grid.sample.center
    Blob::TYPES.each do |type|
      blobs.push(Blob.new(type, *spawn_location))
    end
  end

  def draw
    draw_grid
    draw_blobs
    draw_blob_info
  end

  def draw_grid
    grid.each do |square|
      square.draw
    end
  end

  def draw_blobs
    blobs.each do |blob|
      blob.draw
    end
  end

  def draw_blob_info
    BlobInfo.new(selected_blobs).draw
  end

  def process_click(mouse_x, mouse_y)
    self.selected_blobs = blobs.select do |blob|
      a1 = triangle_area([mouse_x, mouse_y], blob.location, blob.top)
      a2 = triangle_area([mouse_x, mouse_y], blob.location, blob.top_left)
      a3 = triangle_area([mouse_x, mouse_y], blob.top, blob.top_left)
      Blob::AREA == a1 + a2 + a3
    end
  end

  def triangle_area(a, b, c)
  (
    a[0] * (b[1] - c[1]) +
    b[0] * (c[1] - a[1]) +
    c[0] * (a[1] - b[1])
  ).abs / 2.0
  end
end
