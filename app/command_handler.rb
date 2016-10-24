class CommandHandler
  COMMAND_CLASSES = {
    'I' => Commands::NewImage,
    'C' => Commands::ClearImage,
    'L' => Commands::ColourPixel,
    'V' => Commands::VerticalLine,
    'H' => Commands::HorizontalLine,
    'S' => Commands::ShowImage,
    '?' => Commands::Help,
    'X' => Commands::Quit,
  }.freeze

  def initialize(input, current_image)
    @input = input
    @current_image = current_image
    @invalid_command = Commands::Invalid
  end

  def process
    command = COMMAND_CLASSES.fetch(input[0], invalid_command).new(input, current_image)
    command = invalid_command.new unless command.valid?
    command.process
  end

  private

  attr_reader :input, :invalid_command, :current_image
end
