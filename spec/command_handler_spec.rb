require 'spec_helper'

RSpec.describe CommandHandler do

  let(:current_image) { double(:current_image) }

  subject { described_class.new(command, current_image).process }

  context "X" do
  let(:command) { 'X' }
    it "returns message" do
      expect(subject[:message]).to eq 'goodbye!'
    end
  end
  context "t" do
  let(:command) { 't' }
    it "returns message" do
      expect(subject[:message]).to eq 'unrecognised command :('
    end
  end
  context "?" do
  let(:command) { '?' }
    it "returns message" do
      expect(subject[:message]).to eq "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
    end
  end
end
