require 'spec_helper'

RSpec.describe Commands::ClearImage do

  let(:size) { 4 }
  let(:first) { double(:first, size: size) }
  let(:current_image) { double(:current_image, first: first, size: size) }
  let(:command) { described_class.new(image) }

  describe "#required_args" do
    it "has 0" do
      expect(described_class::REQUIRED_ARGS).to eq 0
    end
  end
  describe "#process" do
    context "current_image present" do
    let(:image) { instance_double("Image", current_image: current_image) }
      it "image receives message" do
        expect(image).to receive(:new_image).with(size, size)
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
end
