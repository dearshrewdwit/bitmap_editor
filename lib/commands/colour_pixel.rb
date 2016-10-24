module Commands
  class ColourPixel < Base
    ACCEPTED_COLOURS = ('A'..'Z').to_a.freeze

    def process
      update_image
      { image: current_image }
    end

    def valid?
      split_input = input.split(' ')
      return false unless split_input.count == 4
      @x, @y = split_input[1].to_i, split_input[2].to_i
      return false unless x > 0 && x < current_image.first.size
      return false unless y > 0 && y < current_image.size
      @colour = split_input[3]
      return false unless ACCEPTED_COLOURS.include?(colour)
      true
    end

    private

    attr_reader :x, :y, :colour

    def update_image
      current_image[x][y] = colour
    end
  end
end
