class Square
  SIZE = 200

  attr_accessor :x, :y, :top_left, :top_right, :bottom_right, :bottom_left, :center

  def initialize(x, y)
    self.x = x
    self.y = y
    self.top_left = [x, y]
    self.top_right = [x + SIZE, y]
    self.bottom_right = [x + SIZE, y + SIZE]
    self.bottom_left = [x, y + SIZE]
    self.center = [
      (top_left[0] + bottom_right[0]) / 2,
      (top_left[1] + bottom_right[1]) / 2,
    ]    
  end

  def to_s
    "x: #{x}, y: #{y}, c: #{center}"
  end

  def draw
    Gosu.draw_rect(*top_right, SIZE, SIZE, Gosu::Color::BLACK)
    draw_border
    draw_diagonal
    draw_message
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

  def draw_message
    details = Gosu::Image.from_text(to_s, 15, :font => Gosu.default_font_name)
    details.draw(x, y + 10, 0)
  end
end
