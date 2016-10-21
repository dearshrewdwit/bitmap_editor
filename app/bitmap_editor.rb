class BitmapEditor

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      message = CommandHandler.new(input).process
      @running = false if input == 'X'
      puts message
    end
  end
end
