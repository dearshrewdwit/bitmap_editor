require 'spec_helper'

RSpec.describe BitmapEditor do
  let(:bitmap_editor) { described_class.new }

  before { allow(STDIN).to receive(:gets).and_return(*input) }

  context "'t' unrecognised command" do
    let(:input) { ['t', 'X'] }

    it "user input ('t') is shown unrecognised" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with("unrecognised command 't' :(")
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'X' to quit" do
    let(:input) { ['X'] }

    it "user input ('X') is shown goodbye" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'I' new image" do
    let(:input) { ["I 3 4", 'X'] }

    it "does not output to STDOUT" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'L' colours pixel" do
    let(:input) { ["I 3 3", "L 3 3 P", 'X'] }

    it "does not output to STDOUT" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'H' draws a horizontal_line" do
    let(:input) { ["I 3 3", "H 3 3 1 P", 'X'] }

    it "does not output to STDOUT" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'L' draws a vertical line" do
    let(:input) { ["I 3 3", "V 1 3 3 P", 'X'] }

    it "does not output to STDOUT" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'C' clears image" do
    let(:input) { ["I 3 3", "C", 'X'] }

    it "does not output to STDOUT" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'S' shows image" do
    let(:input) { ["I 3 3", "S", 'X'] }

    it "use input('S') is shown image" do
      expect(STDOUT).to receive(:puts).with('type ? for help')
      expect(STDOUT).to receive(:puts).with(%w(OOO OOO OOO))
      expect(STDOUT).to receive(:puts).with('goodbye!')
      bitmap_editor.run
    end
  end

  context "'?' for help" do
    let(:input) { ['?', 'X'] }

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
      bitmap_editor.run
    end
  end
end
