module Commands
  class NewImage < Base
    REQUIRED_ARGS = 2

    def initialize(x, y, handler)
      @x = x
      @y = y
      @handler = handler
    end

    def process
      fail InvalidCoordinate unless valid_coordinate?(x, y)
      handler.new_image(x.to_i, y.to_i)
    end
  end
end
