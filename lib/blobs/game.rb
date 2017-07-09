class Game < Gosu::Window
  attr_accessor :world

  def initialize(width=800, heigth=800, fullscreen=false)
    super
    self.caption = 'Blobs'
    self.world = World.new(width, height)
    @initial_draw = false
  end

  def update
  end

  def draw
    @initial_draw = true
    world.draw
  end

  def button_down(id)
    if id == Gosu::MsLeft
      world.process_click(mouse_x, mouse_y)
    end
  end

  #def needs_redraw?
    #!@initial_draw
  #end

  def needs_cursor?
    true
  end

  def message
    res = ["Blob count = #{world.blobs.count}"]
    world.blobs.each do |blob|
      res.push(blob.genome);
    end

    res.join("\n\n")
  end
end
