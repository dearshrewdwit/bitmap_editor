module Commands
  class VerticalLine < Base
    REQUIRED_ARGS = 4

    def initialize(x, start, stop, colour, handler)
      @x = x
      @start = start
      @stop = stop
      @colour = colour
      @handler = handler
    end

    def process
      fail NoImage unless image
      fail InvalidCoordinate unless valid_coordinate?(x, start) && valid_coordinate?(x, stop)
      fail InvalidColour unless ACCEPTED_COLOURS.include?(colour)
      handler.vertical_line(to_c(x), to_c(start), to_c(stop), colour)
    end
  end
end
