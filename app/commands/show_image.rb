module Commands
  class ShowImage < Base
    REQUIRED_ARGS = 0

    def process
      fail NoImage unless image
      handler.show_image
    end
  end
end
