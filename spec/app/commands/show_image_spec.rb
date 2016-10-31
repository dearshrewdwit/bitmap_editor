require 'spec_helper'

RSpec.describe Commands::ShowImage do

  let(:input) { ['S'] }
  let(:command) { described_class.new(*input, image) }

  describe "#required_args" do
    it "has 0" do
      expect(described_class::REQUIRED_ARGS).to eq 0
    end
  end
  describe "#process" do
    context "current_image present" do
    let(:image) { instance_double("Image", current_image: true) }
      it "image receives message" do
        expect(image).to receive(:show_image)
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
