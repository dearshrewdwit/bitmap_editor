module Commands
  class Quit < Base
    def process
      { message: 'goodbye!' }
    end

    def valid?
      input.length == 1
    end
  end
end
