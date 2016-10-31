require 'spec_helper'

RSpec.describe CommandHandler do

  let(:image) { instance_double("Image") }
  let(:handler) { described_class.new(input, image) }

  context "invalid command" do
    let(:input) { "rf" }
    it "Invalid Command" do
      expect { handler.process }.to raise_error(InvalidCommand)
    end

  end
  context "correct command, invalid parameters" do
    let(:input) { "X J" }
    it "Invalid parameters" do
      expect { handler.process }.to raise_error(InvalidParameters)
    end
  end
  context "Quit" do
  let(:input) { "X" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::Quit).to receive(:process)
      handler.process
    end
  end
  context "Help" do
  let(:input) { "?" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::Help).to receive(:process)
      handler.process
    end
  end
  context "Show Image" do
  let(:input) { "S" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::ShowImage).to receive(:process)
      handler.process
    end
  end
  context "Horizontal Line" do
  let(:input) { "H 1 1 1 P" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::HorizontalLine).to receive(:process)
      handler.process
    end
  end
  context "Vertical Line" do
  let(:input) { "V 1 1 1 P" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::VerticalLine).to receive(:process)
      handler.process
    end
  end
  context "Colour Pixel" do
  let(:input) { "L 1 1 P" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::ColourPixel).to receive(:process)
      handler.process
    end
  end
  context "Clear Image" do
  let(:input) { "C" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::ClearImage).to receive(:process)
      handler.process
    end
  end
  context "New Image" do
  let(:input) { "I 1 1" }
    it "correct command retrieved and processed" do
      expect_any_instance_of(Commands::NewImage).to receive(:process)
      handler.process
    end
  end
end
