class ImageHandler

  attr_reader :image

  def initialize(image = nil)
    @image = image
  end

  def new_image(x, y)
    @image = Image.new(x, y)
  end

  def horizontal_line(start, stop, y, colour)
    range(start, stop).each { |x| image[y][x] = colour }
  end

  def colour_pixel(x, y, colour)
    image[y][x] = colour
  end

  def vertical_line(x, start, stop, colour)
    range(start, stop).each { |y| image[y][x] = colour }
  end

  def show_image
    puts image
  end

  private

  def range(a, b)
    Range.new(*[a, b].sort)
  end
end
