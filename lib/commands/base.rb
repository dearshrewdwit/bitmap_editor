module Commands
  class Base
    STARTING_COLOUR = 'O'.freeze
    ACCEPTED_COLOURS = ('A'..'Z').to_a.freeze

    def initialize(input = nil, current_image = nil)
      @input = input
      @current_image = current_image
    end

    def valid?
      true
    end

    attr_reader :input, :current_image
  end
end
