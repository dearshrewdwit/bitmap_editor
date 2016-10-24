module Commands
  class ColourPixel < Base
    def process
      set_coordinates_and_colour
      update_image
      { image: current_image }
    end

    def valid?
      return false unless input.split(' ').count == 4
      _letter, x, y, colour = input.split(' ')
      CoordinateValidator.new(x, y, current_image).valid? &&
        ACCEPTED_COLOURS.include?(colour) && current_image
    end

    private

    attr_reader :x, :y, :colour

    def set_coordinates_and_colour
      _letter, @x, @y, @colour = input.split(' ')
    end

    def update_image
      current_image[y.to_i-1][x.to_i-1] = colour
    end
  end
end
