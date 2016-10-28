require 'spec_helper'
RSpec.describe "#colour_pixel" do
  let(:image) { Image.new }

  context "node changes colour" do
    let(:expected_image) { [%w(O O), %w(O L)] }

    it "returns expected image" do
      image.new_image(2, 2)
      image.colour_pixel(1, 1, 'L')
      expect(image.current_image).to eq expected_image
    end
  end
end
