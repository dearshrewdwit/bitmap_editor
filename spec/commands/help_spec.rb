require 'spec_helper'

RSpec.describe Commands::Help do
  let(:input) { '?' }

  subject { described_class.new(input) }

  describe "#process" do
    it "returns message" do
      expect(subject.process[:message]).to eq "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
    end
  end

  describe "#valid" do
    context "invalid input" do
    let(:input) { '?extra characters' }
      it "receives invalid input" do
        expect(subject).to_not be_valid
      end
    end
    context "valid input" do
      it "is valid" do
        expect(subject).to be_valid
      end
    end
  end
end
