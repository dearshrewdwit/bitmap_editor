Dir[File.join(File.dirname(__FILE__), 'app/commands/*.rb')].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), 'app/**/*.rb')].each { |f| require f }

BitmapEditor.new.run
