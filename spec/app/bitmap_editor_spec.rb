require 'spec_helper'

RSpec.describe BitmapEditor do
  subject(:bitmap_editor) { described_class.new }

  before { allow(STDIN).to receive(:gets).and_return(*input) }

  context "'t' unrecognised command" do
    let(:input) { ['t', 'X'] }

    it "user input ('t') is shown unrecognised" do
      expect { bitmap_editor.run }.to output("type ? for help\n> unrecognised command 't' :(\n> goodbye!\n").to_stdout
    end
  end

  context "'X' to quit" do
    let(:input) { ['X'] }

    it "user input ('X') is shown goodbye" do
      expect { bitmap_editor.run }.to output("type ? for help\n> goodbye!\n").to_stdout
    end
  end

  context "'I' new image" do
    let(:input) { ["I 3 4", 'X'] }

    it "does not output to STDOUT" do
      expect { bitmap_editor.run }.to output("type ? for help\n> > goodbye!\n").to_stdout
    end
  end

  context "'L' colours pixel" do
    let(:input) { ["I 3 3", "L 3 3 P", 'X'] }

    it "does not output to STDOUT" do
      expect { bitmap_editor.run }.to output("type ? for help\n> > > goodbye!\n").to_stdout
    end
  end

  context "'H' draws a horizontal_line" do
    let(:input) { ["I 3 3", "H 3 3 1 P", 'X'] }

    it "does not output to STDOUT" do
      expect { bitmap_editor.run }.to output("type ? for help\n> > > goodbye!\n").to_stdout
    end
  end

  context "'L' draws a vertical line" do
    let(:input) { ["I 3 3", "V 1 3 3 P", 'X'] }

    it "does not output to STDOUT" do
      expect { bitmap_editor.run }.to output("type ? for help\n> > > goodbye!\n").to_stdout
    end
  end

  context "'C' clears image" do
    let(:input) { ["I 3 3", "C", 'X'] }

    it "does not output to STDOUT" do
      expect { bitmap_editor.run }.to output("type ? for help\n> > > goodbye!\n").to_stdout
    end
  end

  context "'S' shows image" do
    let(:input) { ["I 3 3", "S", 'X'] }

    it "use input('S') is shown image" do
      expect { bitmap_editor.run }.to output("type ? for help\n> > OOO\nOOO\nOOO\n> goodbye!\n").to_stdout
    end
  end

  context "'?' for help" do
    let(:input) { ['?', 'X'] }

    it "user input ('?') is shown command help" do
      expect { bitmap_editor.run }.to output("type ? for help\n> ? - Help\nI M N - Create a new M x N image with all pixels coloured white (O).\nC - Clears the table, setting all pixels to white (O).\nL X Y C - Colours the pixel (X,Y) with colour C.\nV X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).\nH X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).\nS - Show the contents of the current image\nX - Terminate the session\n> goodbye!\n").to_stdout
    end
  end
end
