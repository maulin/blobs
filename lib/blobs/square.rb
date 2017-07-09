class Square
  SIZE = 100

  attr_accessor :x, :y, :top_left, :top_right, :bottom_right, :bottom_left

  def initialize(x, y)
    self.x = x
    self.y = y
    self.top_left = [x, y]
    self.top_right = [x + SIZE, y]
    self.bottom_right = [x + SIZE, y + SIZE]
    self.bottom_left = [x, y + SIZE]
  end

  def to_s
    "x: #{x}, y: #{y}"
  end

  def draw
    Gosu.draw_rect(*top_right, SIZE, SIZE, Gosu::Color::BLACK)
    details = Gosu::Image.from_text(to_s, 15, :font => Gosu.default_font_name)
    details.draw(x, y + 10, 0)
    draw_border
    draw_diagonal
  end

  def draw_border
    Gosu.draw_line(*top_left, Gosu::Color::GRAY, *top_right, Gosu::Color::GRAY)
    Gosu.draw_line(*top_right, Gosu::Color::GRAY, *bottom_right, Gosu::Color::GRAY)
    Gosu.draw_line(*bottom_right, Gosu::Color::GRAY, *bottom_left, Gosu::Color::GRAY)
    Gosu.draw_line(*bottom_left, Gosu::Color::GRAY, *top_left, Gosu::Color::GRAY)
  end

  def draw_diagonal
    Gosu.draw_line(*top_left, Gosu::Color::GRAY, *bottom_right, Gosu::Color::GRAY)
    Gosu.draw_line(*bottom_left, Gosu::Color::GRAY, *top_right, Gosu::Color::GRAY)
  end
end
