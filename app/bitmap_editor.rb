class BitmapEditor

  attr_reader :handler
  def initialize(handler = CommandHandler)
    @image = ImageHandler.new
    @handler = handler
  end

  def run
    running = true
    puts 'type ? for help'
    while running
      print '> '
      input = STDIN.gets.chomp
      running = false if input == 'X'
    begin
      handler.new(input, @image).process
    rescue BitmapError => e
      puts e.message
    end
    end
  end
end
