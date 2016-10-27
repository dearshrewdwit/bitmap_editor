module Commands
  class ShowImage < Base
    def process
      fail NoImage unless image.current_image
      image.show_image
    end
  end
end
