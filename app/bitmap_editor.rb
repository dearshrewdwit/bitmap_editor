class BitmapEditor
  def initialize
    @image_state = ImageState.new
  end

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      @running = false if input == 'X'
      response = CommandHandler.new(input, image_state.current_image).process
      @image_state.update(response[:image]) if response[:image]
      puts response[:message] if response[:message]
    end
  end
end
