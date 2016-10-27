module Commands
  class ClearImage < Base
    def process
      fail NoImage unless image.current_image
      x = image.current_image.first.size
      y = image.current_image.size
      image.new_image(x, y)
    end
  end
end
