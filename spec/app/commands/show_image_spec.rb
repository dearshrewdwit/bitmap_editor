require 'spec_helper'

RSpec.describe Commands::ShowImage do
  let(:input) { ['S'] }
  let(:image) { instance_double("Image") }

  subject(:command) { described_class.new(*input, handler) }

  describe "#required_args" do
    it "has 0" do
      expect(described_class::REQUIRED_ARGS).to eq 0
    end
  end
  describe "#process" do
    context "image present" do
    let(:handler) { instance_double("ImageHandler", image: image) }
      it "image receives message" do
        expect(handler).to receive(:show_image)
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
