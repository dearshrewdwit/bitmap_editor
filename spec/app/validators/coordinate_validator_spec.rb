require 'spec_helper'

RSpec.describe CoordinateValidator do

  subject { described_class.new(x, y) }

  context "valid coordinates" do
    let(:x) { '3' }
    let(:y) { '4' }

    it "#valid? returns true" do
      expect(subject).to be_valid
    end
  end
  context "invalid coordinates" do
    context "not integer coordinates" do
      let(:x) { '2.4' }
      let(:y) { '52' }

      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
    context "coordinates include non digit characters" do
      let(:x) { '24t' }
      let(:y) { '52' }

      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
    context "x is > 250" do
      let(:x) { '252' }
      let(:y) { '4' }

      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
    context "x is < 1" do
      let(:x) { '0' }
      let(:y) { '4' }

      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
    context "y is > 250" do
      let(:x) { '4' }
      let(:y) { '300' }

      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
    context "y is < 1" do
      let(:x) { '45' }
      let(:y) { '-2' }

      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
  end
end
