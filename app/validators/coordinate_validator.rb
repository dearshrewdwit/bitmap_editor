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
    Integer(x+y) rescue false
  end

  def valid_coordinates?
    x_max = current_image ? current_image.first.size : MAX
    y_max = current_image ? current_image.size : MAX
    x.to_i.between?(MIN, x_max) && y.to_i.between?(MIN, y_max)
  end

  attr_reader :x, :y, :current_image
end
