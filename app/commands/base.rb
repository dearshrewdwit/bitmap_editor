module Commands
  class Base
    ACCEPTED_COLOURS = ('A'..'Z').to_a.freeze

    def self.has_args?(input_args)
      input_args == self::REQUIRED_ARGS
    end

    def initialize(*parsed_input, handler)
      @handler = handler
    end

    def valid_coordinate?(x, y)
      CoordinateValidator.new(x, y, image).valid?
    end

    def to_c(s)
      s.to_i - 1
    end

    def image
      handler.image
    end

    attr_reader :handler, :x ,:y, :colour, :start, :stop
  end
end
