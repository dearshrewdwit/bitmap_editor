module Commands
  class VerticalLine < Base
    def process
      set_coordinates_and_colour
      update_image
      { image: current_image }
    end

    def valid?
      split_input = input.split(' ')
      return false unless split_input.count == 5
      _letter, column, start, stop, colour = split_input
      CoordinateValidator.new(column, start, current_image).valid? &&
        CoordinateValidator.new(column, stop, current_image).valid? &&
        ACCEPTED_COLOURS.include?(colour) && current_image
    end

    private

    attr_reader :start, :stop, :column, :colour

    def set_coordinates_and_colour
      _letter, @column, @start, @stop, @colour = input.split(' ')
    end

    def update_image
      ((start.to_i-1)..(stop.to_i-1)).to_a.each do |row|
        current_image[row][column.to_i-1] = colour
      end
    end
  end
end
