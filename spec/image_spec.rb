require 'spec_helper'

RSpec.describe Image do
  subject(:image) { described_class.new(2, 2) }

  context "new 2x2 image" do
    let(:expected_grid) { [%w(O O), %w(O O)] }

    it "is correct size" do
      expect(image.grid).to eq expected_grid
    end
  end
  context "different starting colour" do
    let(:expected_grid) { [%w(P P), %w(P P)] }

    it "is correct colour" do
      stub_const("Image::STARTING_COLOUR", 'P')
      expect(image.grid).to eq expected_grid
    end
  end
  context "#to_s" do
    it "formats string with newline characters" do
      expect(image.to_s).to eq "OO\nOO\n"
    end
    it "doesn't modify grid" do
      image.to_s
      expect(image.to_s).to eq "OO\nOO\n"
    end
  end
  context "#[]" do
    it "allows [] to work on grid" do
      expect(image[0]).to eq image.grid[0]
    end
  end
  context "#row_size" do
    it "returns length of row" do
      expect(image.row_size).to eq image.grid.first.size
    end
  end
  context "#column_size" do
    it "returns length of column" do
      expect(image.column_size).to eq image.grid.size
    end
  end
end
