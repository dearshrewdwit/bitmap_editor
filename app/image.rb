class Image
  STARTING_COLOUR = 'O'.freeze

  attr_reader :current_image

  def initialize(current_image = nil)
    @current_image = current_image
  end

  def new_image(x, y)
    @current_image = Array.new(y) { Array.new(x, STARTING_COLOUR) }
  end

  def horizontal_line(start, stop, y, colour)
    current_image[y].each_with_index do |_x, index|
      current_image[y][index] = colour if range(start, stop).include?(index)
    end
  end

  def colour_pixel(x, y, colour)
    current_image[y][x] = colour
  end

  def vertical_line(x, start, stop, colour)
    range(start, stop).each { |y| current_image[y][x] = colour }
  end

  def show_image
    puts current_image.map { |row| row.join }
  end

  private

  def range(a, b)
    Range.new(*[a, b].sort)
  end
end
