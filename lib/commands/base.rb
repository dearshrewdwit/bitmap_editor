module Commands
  class Base
    def initialize(input = nil, current_image = nil)
      @input = input
      @current_image = current_image
    end

    attr_reader :input, :current_image
  end
end
