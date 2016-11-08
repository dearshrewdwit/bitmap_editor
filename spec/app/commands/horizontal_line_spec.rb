require 'spec_helper'

RSpec.describe Commands::HorizontalLine do
  let(:size) { 4 }
  let(:image) { instance_double("Image", row_size: size, column_size: size) }
  let(:handler) { instance_double("ImageHandler", image: image) }
  let(:input) { [start, stop, y, colour] }
  let(:start) { '1' }
  let(:stop) { '4' }
  let(:y) { '1' }
  let(:colour) { 'P' }

  subject(:command) { described_class.new(*input, handler) }

  describe "#required_args" do
    it "has 4" do
      expect(described_class::REQUIRED_ARGS).to eq 4
    end
  end
  describe "#process" do
    context "valid input" do
      context "current_image present" do
        it "image receives message" do
          expect(handler).to receive(:horizontal_line).with(0, 3, 0, 'P')
          command.process
        end
      end

      context "no current_image" do
        let(:handler) { instance_double("ImageHandler", image: nil) }

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
