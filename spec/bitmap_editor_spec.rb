require 'spec_helper'

RSpec.describe BitmapEditor do
  subject { described_class.new }

  context "User input" do
    before { $stdin = StringIO.new(input) }
    after { $stdin = STDIN }

    context "'X' to quit" do
      let(:input) { 'X' }
      it "user input ('X') is shown goodbye" do
        expect(STDOUT).to receive(:puts).with('type ? for help')
        expect(STDOUT).to receive(:puts).with('goodbye!')
        subject.run
      end
    end
    context "'t' unrecognised command" do
      let(:input) { "t\nX" }
      it "user input ('t') is shown unrecognised" do
        expect(STDOUT).to receive(:puts).with('type ? for help')
        expect(STDOUT).to receive(:puts).with('unrecognised command :(')
        expect(STDOUT).to receive(:puts).with('goodbye!')
        subject.run
      end
    end

    context "'I' creates image" do
      let(:input) { "I 3 4\nX" }
      it "prompts user" do
        expect(STDOUT).to receive(:puts).with('type ? for help')
        expect(STDOUT).to receive(:puts).with('goodbye!')
        subject.run
      end
    end
    context "'?' for help" do
      let(:input) { "?\nX" }
      it "user input ('?') is shown command help" do
        expect(STDOUT).to receive(:puts).with('type ? for help')
        expect(STDOUT).to receive(:puts).with("? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session")
        expect(STDOUT).to receive(:puts).with('goodbye!')
        subject.run
      end
    end
  end
end
