class Image
  STARTING_COLOUR = 'O'.freeze

  attr_reader :grid

  def initialize(x, y)
    @grid = Array.new(y) { Array.new(x, STARTING_COLOUR) }
  end

  def to_s
    grid.each_with_object([]) { |i, arr| arr << i << "\n" }.join
  end

  def [](y)
    grid[y]
  end

  def row_size
    grid.first.size
  end

  def column_size
    grid.size
  end
end
