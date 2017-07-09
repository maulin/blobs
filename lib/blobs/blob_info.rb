class BlobInfo
  attr_accessor :blobs

  def initialize(blobs)
    self.blobs = blobs
  end

  def draw
    if blobs.length > 0
      Gosu.draw_rect(100, 100, 200, 300, Gosu::Color::BLUE)
      height = 0
      blobs.each do |blob|
        details = Gosu::Image.from_text(genome(blob), 15, :font => Gosu.default_font_name)
        details.draw(100, 100 + height, 0)
        height += details.height
      end
    end
  end

  def genome(blob)
    res = []
    res.push("-" * 20)
    res.push("type: #{blob.type}")
    blob.dna.genes.each do |k, v|
      res.push("#{k}: #{v.value}")
    end
    res.join("\n")
  end

end
