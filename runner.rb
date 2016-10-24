Dir[File.join(File.dirname(__FILE__), 'lib/**/*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), 'app/**/*.rb')].each { |f| require f }

require 'pry'

BitmapEditor.new.run
