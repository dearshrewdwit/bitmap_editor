module Commands
  class NewImage < Base
    def process
      set_coordinates
      { image: new_image }
    end

    def valid?
      return false unless input.split(' ').count == 3
      _letter, x, y = input.split(' ')
      CoordinateValidator.new(x, y).valid?
    end

    private

    attr_reader :x, :y

    def set_coordinates
      _letter, @x, @y = input.split(' ')
    end

    def new_image
      Array.new(y.to_i) { Array.new(x.to_i, STARTING_COLOUR) }
    end
  end
end
