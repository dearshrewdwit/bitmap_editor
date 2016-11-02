require 'spec_helper'

RSpec.describe Commands::HorizontalLine do

  let(:size) { 4 }
  let(:first) { double(:first, size: size) }
  let(:current_image) { double(:current_image, first: first, size: size) }
  let(:image) { instance_double("Image", current_image: current_image) }
  let(:input) { [x, start, stop, colour] }
  let(:x) { '1' }
  let(:start) { '1' }
  let(:stop) { '4' }
  let(:colour) { 'P' }
  let(:command) { described_class.new(*input, image) }

  describe "#required_args" do
    it "has 4" do
      expect(described_class::REQUIRED_ARGS).to eq 4
    end
  end
  describe "#process" do
    context "valid input" do
      context "current_image present" do
        it "image receives message" do
          expect(image).to receive(:horizontal_line).with(0, 0, 3, 'P')
          command.process
        end
      end
      context "no current_image" do
        let(:image) { instance_double("Image", current_image: false) }

        it "command raises error" do
          expect { command.process }.to raise_error(NoImage)
        end
      end
    end
    context "invalid input" do
      context "invalid coordinate" do
        let(:start) { '300' }

        it "raises error" do
          expect { command.process }.to raise_error(InvalidCoordinate)
        end
      end
      context "invalid colour" do
        let(:colour) { 'P1234' }

        it "raises error" do
          expect { command.process }.to raise_error(InvalidColour)
        end
      end
    end
  end
end
