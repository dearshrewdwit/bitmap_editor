require 'spec_helper'
RSpec.describe "#new_image" do
  let(:image) { Image.new }

  context "initializes with no current image" do
    it "is nil" do
      expect(image.current_image).to be_nil
    end
  end

  context "new 2x2 image" do
    let(:expected_image) { [%w(O O), %w(O O)] }
    it "current_image is 2x2" do
      image.new_image(2, 2)
      expect(image.current_image).to eq expected_image
    end
  end
  context "new 2x2 image" do
    let(:expected_image) { [%w(P P), %w(P P)] }
    it "can change default colour" do
      stub_const("Image::STARTING_COLOUR", 'P')
      image.new_image(2, 2)
      expect(image.current_image).to eq expected_image
    end
  end
end
