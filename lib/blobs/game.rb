class Game < Gosu::Window
  attr_accessor :world

  def initialize(width=800, heigth=800, fullscreen=false)
    super
    self.caption = 'Blobs'
    self.world = World.new(width, height)
    @drawn = false
  end

  def update
  end

  def draw
    @drawn = true
    world.draw_map
  end

  def needs_redraw?
    !@drawn
  end

  def message
    res = ["Blob count = #{world.blobs.count}"]
    world.blobs.each do |blob|
      res.push(blob.genome);
    end

    res.join("\n\n")
  end
end
