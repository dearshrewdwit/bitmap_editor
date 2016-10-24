module Commands
  class Invalid < Base
    def process
      { message: 'unrecognised command :(' }
    end
  end
end
