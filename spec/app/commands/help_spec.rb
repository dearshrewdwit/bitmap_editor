require 'spec_helper'

RSpec.describe Commands::Help do
  let(:image) { instance_double("Image") }
  let(:input) { double(:command) }
  let(:message) do
    "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
  end

  subject { described_class.new(input, image) }

  describe "#required_args" do
    it "has 0" do
      expect(described_class.required_args).to eq 0
    end
  end

  describe "#process" do
    it "returns message" do
      expect { subject.process }.to output("#{message}\n").to_stdout
    end
  end
end
