require 'spec_helper'

RSpec.describe Commands::NewImage do
  let(:image) { instance_double("Image") }
  let(:input) { [x, y] }
  subject { described_class.new(*input, image) }

  describe "#required_args" do
    it "has 2" do
      expect(described_class.required_args).to eq 2
    end
  end
  describe "#process" do
    context "valid input" do
      let(:x) { '4' }
      let(:y) { '4' }

      it "image receives message" do
        expect(image).to receive(:new_image).with(x.to_i, y.to_i)
        subject.process
      end
    end
    context "invalid input" do
      let(:x) { '300' }
      let(:y) { '4' }

      it "command raises error" do
        expect { subject.process }.to raise_error(InvalidCoordinate)
      end
    end
  end
end
