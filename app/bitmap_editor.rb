class BitmapEditor

  def initialize
    @image_handler = ImageHandler.new
    @command_handler = CommandHandler
  end

  def run
    running = true
    puts 'type ? for help'
    while running
      print '> '
      input = STDIN.gets.chomp
      running = false if input == 'X'
    begin
      command_handler.new(input, image_handler).process
    rescue BitmapError => e
      puts e.message
    end
    end
  end

  private

  attr_reader :command_handler, :image_handler
end
