class BitmapError < StandardError
end

class InvalidCommand < BitmapError
  def initialize(command_letter)
    super("unrecognised command '#{command_letter}' :(")
  end
end

class InvalidParameters < BitmapError
  def initialize(msg = 'invalid parameters for command')
    super
  end
end

class NoImage < BitmapError
  def initialize(msg = "no image created yet")
    super
  end
end

class InvalidCoordinate < BitmapError
  def initialize(msg = "command contains an invalid coordinate")
    super
  end
end

class InvalidColour < BitmapError
  def initialize(msg = "Not a valid colour")
    super
  end
end
