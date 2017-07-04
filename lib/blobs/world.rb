class World
  attr_accessor :blobs
  def initialize
    init_blobs
  end

  def init_blobs
    @blobs = []
    Blob::TYPES.each do |type|
      @blobs.push(Blob.new(type))
    end
  end
end
