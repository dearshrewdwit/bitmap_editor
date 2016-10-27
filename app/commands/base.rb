module Commands
  class Base
    ACCEPTED_COLOURS = ('A'..'Z').to_a.freeze

    def self.has_args?(input_args)
      input_args == self.required_args
    end

    def self.required_args
      0
    end

    def initialize(*parsed_input, image)
      @image = image
    end

    def valid_coordinate?(x, y, new_image = false)
      current_image = new_image ? false : image.current_image
      CoordinateValidator.new(x, y, current_image).valid?
    end

    def to_c(s)
      s.to_i - 1
    end
    attr_reader :image, :x ,:y, :colour, :start, :stop
  end
end
