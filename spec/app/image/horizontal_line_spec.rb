require 'spec_helper'
RSpec.describe "#horizontal_line" do
  let(:image) { Image.new }

  context "nodes change colour" do
    let(:expected_image) { [%w(O O), %w(L L)] }
    before { image.new_image(2, 2) }

    it "left to right returns expected image" do
      image.horizontal_line(1, 0, 1, 'L')
      expect(image.current_image).to eq expected_image
    end
    it "right to left returns expected image" do
      image.horizontal_line(0, 1, 1, 'L')
      expect(image.current_image).to eq expected_image
    end
  end
end
