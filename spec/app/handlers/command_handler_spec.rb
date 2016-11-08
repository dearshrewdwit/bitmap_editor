require 'spec_helper'

RSpec.describe CommandHandler do
  let(:image_handler) { instance_double("ImageHandler") }

  subject(:command_handler) { described_class.new(input, image_handler) }

  invalid_input = {
    InvalidCommand => "rf",
    InvalidParameters => "X J",
  }

  valid_input = {
    Commands::Quit => "X",
    Commands::Help => "?",
    Commands::ShowImage => "S",
    Commands::HorizontalLine => "H 1 1 1 P",
    Commands::VerticalLine => "V 1 1 1 P",
    Commands::ColourPixel => "L 1 1 P",
    Commands::ClearImage => "C",
    Commands::NewImage => "I 1 1",
  }

  context "invalid input" do
    invalid_input.each do |error, input|
      context "#{error}" do
        let(:input) { input }

        it "raises error" do
          expect { command_handler.process }.to raise_error(error)
        end
      end
    end
  end

  context "valid command input" do
    valid_input.each do |command, input|
      context "#{command}" do
        let(:input) { input }

        it "correct command retrieved and processed" do
          expect_any_instance_of(command).to receive(:process)
          command_handler.process
        end
      end
    end
  end
end
