module Commands
  class NewImage < Base
    STARTING_COLOUR = 'O'.freeze

    def process
      { image: Array.new(y) { Array.new(x, STARTING_COLOUR) } }
    end

    def valid?
      split_input = input.split(' ')
      return false unless split_input.count == 3
      @x, @y = split_input[1].to_i, split_input[2].to_i
      @x <= 250 && @x >= 1 && @y <= 250 && @y >= 1
    end

    private

    attr_reader :x, :y
  end
end
