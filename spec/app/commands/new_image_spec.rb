require 'spec_helper'

RSpec.describe Commands::NewImage do
  let(:image) { instance_double("Image", row_size: x.to_i, column_size: y.to_i) }
  let(:handler) { instance_double("ImageHandler", image: image) }
  let(:input) { [x, y] }
  let(:x) { '4' }
  let(:y) { '4' }

  subject(:command) { described_class.new(*input, handler) }

  describe "#required_args" do
    it "has 2" do
      expect(described_class::REQUIRED_ARGS).to eq 2
    end
  end
  describe "#process" do
    context "valid input" do
      it "handler receives message" do
        expect(handler).to receive(:new_image).with(x.to_i, y.to_i)
        command.process
      end
    end
    context "invalid input" do
      let(:handler) { instance_double("ImageHandler", image: nil) }
      let(:x) { '300' }

      it "command raises error" do
        expect { command.process }.to raise_error(InvalidCoordinate)
      end
    end
  end
end
