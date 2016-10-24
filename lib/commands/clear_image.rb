module Commands
  class ClearImage < Base
    def process
      { image: cleared_image }
    end

    def valid?
      input.length == 1 && current_image
    end

    private

    def cleared_image
      x = current_image.first.size
      y = current_image.size
      Array.new(y) { Array.new(x, STARTING_COLOUR) }
    end
  end
end
