module Commands
  class HorizontalLine < Base
    def process
      set_coordinates_and_colour
      update_image
      { image: current_image }
    end

    def valid?
      return false unless input.split(' ').count == 5
      _letter, start, stop, row, colour = input.split(' ')
      [start, stop].all? { |x| CoordinateValidator.new(x, row, current_image).valid? } &&
        ACCEPTED_COLOURS.include?(colour) && current_image
    end

    private

    attr_reader :start, :stop, :row, :colour

    def set_coordinates_and_colour
      _letter, @start, @stop, @row, @colour = input.split(' ')
    end

    def update_image
      current_image[row.to_i-1].each_with_index do |_i, index|
        current_image[row.to_i-1][index] = colour if range.include?(index)
      end
    end

    def range
      ((start.to_i-1)..(stop.to_i-1)).to_a
    end
  end
end
