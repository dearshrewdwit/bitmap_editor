require 'spec_helper'

RSpec.describe ImageHandler do
  subject(:handler) { described_class.new }

  context "node changes colour" do
    let(:expected_image) { [%w(O O), %w(O L)] }
    before { handler.new_image(2, 2) }

    it "returns expected image" do
      handler.colour_pixel(1, 1, 'L')
      expect(handler.image.grid).to eq expected_image
    end
  end
end
