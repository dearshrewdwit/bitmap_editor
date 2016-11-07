require 'spec_helper'

RSpec.describe Image do
  subject(:image) { described_class.new }

  context "nodes change colour" do
    let(:expected_image) { [%w(O L), %w(O L)] }
    before { image.new_image(2, 2) }

    it "top to bottom returns expected image" do
      image.vertical_line(1, 0, 1, 'L')
      expect(image.current_image).to eq expected_image
    end
    it "bottom to top returns expected image" do
      image.vertical_line(1, 1, 0, 'L')
      expect(image.current_image).to eq expected_image
    end
  end
end
