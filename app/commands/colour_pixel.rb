module Commands
  class ColourPixel < Base
    REQUIRED_ARGS = 3

    def initialize(x, y, colour, handler)
      @x = x
      @y = y
      @colour = colour
      @handler = handler
    end

    def process
      fail NoImage unless handler.image
      fail InvalidCoordinate unless valid_coordinate?(x, y)
      fail InvalidColour unless ACCEPTED_COLOURS.include?(colour)
      handler.colour_pixel(to_c(x), to_c(y), colour)
    end
  end
end
