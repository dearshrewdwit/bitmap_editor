module Commands
  class HorizontalLine < Base
    REQUIRED_ARGS = 4

    def initialize(start, stop, y, colour, image)
      @start = start
      @stop = stop
      @y = y
      @colour = colour
      @image = image
    end

    def process
      fail NoImage unless image.current_image
      fail InvalidCoordinate unless valid_coordinate?(start, y) && valid_coordinate?(stop, y)
      fail InvalidColour unless ACCEPTED_COLOURS.include?(colour)
      image.horizontal_line(to_c(start), to_c(stop), to_c(y), colour)
    end
  end
end
