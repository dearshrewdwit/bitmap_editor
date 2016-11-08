require 'spec_helper'

RSpec.describe ImageHandler do
  subject(:handler) { described_class.new }

  context "initializes without image" do
    it "is nil" do
      expect(handler.image).to be_nil
    end
  end
  context "new image" do
    it "Image is created" do
      expect(Image).to receive(:new).with(2, 2)
      handler.new_image(2, 2)
    end
  end
end
