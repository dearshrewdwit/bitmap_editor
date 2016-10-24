module Commands
  class NewImage < Base
    def process
      set_coordinates
      { image: Array.new(y.to_i) { Array.new(x.to_i, STARTING_COLOUR) } }
    end

    def valid?
      split_input = input.split(' ')
      return false unless split_input.count == 3
      x, y = split_input[1], split_input[2]
      CoordinateValidator.new(x, y).valid?
    end

    private

    def set_coordinates
      split_input = input.split(' ')
      @x, @y = split_input[1], split_input[2]
    end

    attr_reader :x, :y
  end
end
