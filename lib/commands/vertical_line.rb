module Commands
  class VerticalLine < Base
    def process
      set_coordinates_and_colour
      update_image
      { image: current_image }
    end

    def valid?
      return false unless input.split(' ').count == 5
      _letter, column, start, stop, colour = input.split(' ')
      [start, stop].all? { |y| CoordinateValidator.new(column, y, current_image).valid? } &&
        ACCEPTED_COLOURS.include?(colour) && current_image
    end

    private

    attr_reader :start, :stop, :column, :colour

    def set_coordinates_and_colour
      _letter, @column, @start, @stop, @colour = input.split(' ')
    end

    def update_image
      range.each { |row| current_image[row][column.to_i-1] = colour }
    end

    def range
      ((start.to_i-1)..(stop.to_i-1)).to_a
    end
  end
end
