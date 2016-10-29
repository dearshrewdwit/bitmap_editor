class CoordinateValidator
  MIN = 1
  MAX = 250

  def initialize(x, y, current_image = nil)
    @x = x
    @y = y
    @current_image = current_image
  end

  def valid?
    numbers_only? && valid_coordinates?
  end

  private

  def numbers_only?
    !/\D/.match(x+y)
  end

  def valid_coordinates?
    x_max = current_image ? current_image.first.size : MAX
    y_max = current_image ? current_image.size : MAX
    x.to_i <= x_max && x.to_i >= MIN && y.to_i <= y_max && y.to_i >= MIN
  end

  attr_reader :x, :y, :current_image
end
