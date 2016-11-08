require 'spec_helper'

RSpec.describe Commands::ClearImage do
  let(:size) { 2 }
  let(:image) { instance_double("Image", row_size: size, column_size: size) }
  let(:handler) { instance_double("ImageHandler", image: image) }

  subject(:command) { described_class.new(handler) }

  describe "#required_args" do
    it "has 0" do
      expect(described_class::REQUIRED_ARGS).to eq 0
    end
  end
  describe "#process" do
    context "image present" do
      it "image receives message" do
        expect(handler).to receive(:new_image).with(size, size)
        command.process
      end
    end
    context "no image" do
    let(:handler) { instance_double("ImageHandler", image: nil) }
      it "command raises error" do
        expect { command.process }.to raise_error(NoImage)
      end
    end
  end
end
