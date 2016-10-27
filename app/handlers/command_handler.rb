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

  def initialize(input, image)
    @split_input = input.split(' ')
    @image = image
  end

  def process
    command = COMMAND_CLASSES[command_letter]
    fail InvalidCommand.new(command_letter) unless command
    fail InvalidParameters unless command.has_args?(parsed_input.count)
    command.new(*parsed_input, image).process
  end

  private

  def command_letter
    split_input.first
  end

  def parsed_input
    split_input[1..-1]
  end

  attr_reader :split_input, :image
end
