require 'spec_helper'

RSpec.describe Commands::ColourPixel do
  let(:size) { 4 }
  let(:first) { double(:first, size: size) }
  let(:current_image) { double(:current_image, first: first, size: size) }
  let(:image) { instance_double("Image", current_image: current_image) }
  let(:input) { [x, y, colour] }

  subject(:command) { described_class.new(*input, image) }

  describe "#required_args" do
    it "has 3" do
      expect(described_class::REQUIRED_ARGS).to eq 3
    end
  end

  describe "#process" do
    context "valid input" do
      let(:x) { '4' }
      let(:y) { '4' }
      let(:colour) { 'P' }

      context "with current_image" do
        it "sends message to image with correct args" do
          expect(image).to receive(:colour_pixel).with(x.to_i-1, y.to_i-1, colour)
          command.process
        end
      end

      context "no current_image" do
        let(:image) { instance_double("Image", current_image: false) }

        it "raises error" do
          expect { command.process }.to raise_error(NoImage)
        end
      end
    end

    context "invalid input" do
      context "invalid coordinate" do
        let(:x) { '300' }
        let(:y) { '4' }
        let(:colour) { 'P' }

        it "raises error" do
          expect { command.process }.to raise_error(InvalidCoordinate)
        end
      end

      context "invalid colour" do
        let(:x) { '4' }
        let(:y) { '4' }
        let(:colour) { 'P2435' }

        it "raises error" do
          expect { command.process }.to raise_error(InvalidColour)
        end
      end
    end
  end
end
