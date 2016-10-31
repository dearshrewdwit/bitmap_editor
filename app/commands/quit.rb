module Commands
  class Quit < Base
    REQUIRED_ARGS = 0

    def process
      puts 'goodbye!'
    end
  end
end
