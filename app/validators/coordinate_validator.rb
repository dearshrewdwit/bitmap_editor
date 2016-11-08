class CoordinateValidator
  MIN = 1
  MAX = 250

  def initialize(x, y, image)
    @x = x
    @y = y
    @image = image
  end

  def valid?
    numbers_only? && valid_coordinates?
  end

  private

  def numbers_only?
    Integer(x+y) rescue false
  end

  def valid_coordinates?
    x_max = image ? image.row_size : MAX
    y_max = image ? image.column_size : MAX
    x.to_i.between?(MIN, x_max) && y.to_i.between?(MIN, y_max)
  end

  attr_reader :x, :y, :image
end
