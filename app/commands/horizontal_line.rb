module Commands
  class HorizontalLine < Base
    REQUIRED_ARGS = 4

    def initialize(start, stop, y, colour, handler)
      @start = start
      @stop = stop
      @y = y
      @colour = colour
      @handler = handler
    end

    def process
      fail NoImage unless handler.image
      fail InvalidCoordinate unless valid_coordinate?(start, y) && valid_coordinate?(stop, y)
      fail InvalidColour unless ACCEPTED_COLOURS.include?(colour)
      handler.horizontal_line(to_c(start), to_c(stop), to_c(y), colour)
    end
  end
end
