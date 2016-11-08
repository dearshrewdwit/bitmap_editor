require 'spec_helper'

RSpec.describe ImageHandler do
  subject(:handler) { described_class.new }

  context "nodes change colour" do
    let(:expected_image) { [%w(O O), %w(L L)] }
    before { handler.new_image(2, 2) }

    it "left to right returns expected image" do
      handler.horizontal_line(1, 0, 1, 'L')
      expect(handler.image.grid).to eq expected_image
    end
    it "right to left returns expected image" do
      handler.horizontal_line(0, 1, 1, 'L')
      expect(handler.image.grid).to eq expected_image
    end
  end
end
