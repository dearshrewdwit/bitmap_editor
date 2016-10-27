module Commands
  class ColourPixel < Base
    def self.required_args
      3
    end

    def initialize(x, y, colour, image)
      @x = x
      @y = y
      @colour = colour
      @image = image
    end

    def process
      fail NoImage unless image.current_image
      fail InvalidCoordinate unless valid_coordinate?(x, y)
      fail InvalidColour unless ACCEPTED_COLOURS.include?(colour)
      image.colour_pixel(to_c(x), to_c(y), colour)
    end
  end
end
