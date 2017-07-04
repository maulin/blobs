class Game < Gosu::Window
  def initialize(width=800, heigth=600, fullscreen=false)
    super
    self.caption = 'Blobs'
    @world = World.new
  end

  def update
  end

  def draw
    @message = Gosu::Image.from_text(message, 20, :font => Gosu.default_font_name)
    @message.draw(10, 10, 0)
  end

  def message
    res = ["Blob count = #{@world.blobs.count}"]
    @world.blobs.each do |blob|
      res.push(blob.genome);
    end

    res.join("\n\n")
  end
end
