module Commands
  class NewImage < Base
    REQUIRED_ARGS = 2

    def initialize(x, y, image)
      @x = x
      @y = y
      @image = image
    end

    def process
      fail InvalidCoordinate unless valid_coordinate?(x, y, true)
      image.new_image(x.to_i, y.to_i)
    end
  end
end
