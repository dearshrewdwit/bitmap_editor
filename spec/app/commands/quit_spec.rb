require 'spec_helper'

RSpec.describe Commands::Quit do
  let(:image) { instance_double("Image") }
  let(:input) { double(:command) }
  let(:message) { "goodbye!\n" }

  subject(:command) { described_class.new(input, image) }

  describe "#required_args" do
    it "has 0" do
      expect(described_class::REQUIRED_ARGS).to eq 0
    end
  end

  describe "#process" do
    it "returns message" do
      expect { command.process }.to output(message).to_stdout
    end
  end
end
