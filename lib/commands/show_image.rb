module Commands
  class ShowImage < Base
    def process
      { message: image }
    end

    def valid?
      input.length == 1
    end

    private

    def image
      current_image.map { |row| row.join }
    end
  end
end
