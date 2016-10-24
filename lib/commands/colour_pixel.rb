module Commands
  class ColourPixel < Base
    def process
      set_coordinates_and_colour
      update_image
      { image: current_image }
    end

    def valid?
      split_input = input.split(' ')
      return false unless split_input.count == 4
      x, y, colour = split_input[1], split_input[2], split_input[3]
      CoordinateValidator.new(x, y, current_image).valid? &&
        ACCEPTED_COLOURS.include?(colour) && current_image
    end

    private

    attr_reader :x, :y, :colour

    def set_coordinates_and_colour
      split_input = input.split(' ')
      @x, @y, @colour = split_input[1].to_i, split_input[2].to_i, split_input[3]
    end

    def update_image
      current_image[y-1][x-1] = colour
    end
  end
end
