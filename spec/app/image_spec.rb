require 'spec_helper'

RSpec.describe ImageState do
  subject { described_class.new }

  context "initializes with no current image" do
    it "is nil" do
      expect(subject.current_image).to be_nil
    end
  end
  context "stores 2x2 image" do
    let(:image) { [%w(O O), %w(O O)] }
    it "has a current_image" do
      subject.update(image)
      expect(subject.current_image). to eq image
    end
  end
end
