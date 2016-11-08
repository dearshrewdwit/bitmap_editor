module Commands
  class ClearImage < Base
    REQUIRED_ARGS = 0

    def process
      fail NoImage unless handler.image
      x = image.row_size
      y = image.column_size
      handler.new_image(x, y)
    end
  end
end
