require 'spec_helper'

RSpec.describe CoordinateValidator do
  let(:x) { '4' }
  let(:y) { '4' }
  subject(:validator) { described_class.new(x, y,  nil) }

  context "no current_image" do
    context "valid coordinate" do
      it "#valid? returns true" do
        expect(validator).to be_valid
      end
    end
    context "invalid coordinates" do
      context "not integer coordinates" do
        let(:x) { '2.4' }

        it "#valid? returns false" do
          expect(validator).to_not be_valid
        end
      end
      context "coordinates include non digit characters" do
        let(:x) { '24t' }

        it "#valid? returns false" do
          expect(validator).to_not be_valid
        end
      end
      context "x is > 250" do
        let(:x) { '252' }

        it "#valid? returns false" do
          expect(validator).to_not be_valid
        end
      end
      context "x is < 1" do
        let(:x) { '0' }

        it "#valid? returns false" do
          expect(validator).to_not be_valid
        end
      end
      context "y is > 250" do
        let(:y) { '300' }

        it "#valid? returns false" do
          expect(validator).to_not be_valid
        end
      end
      context "y is < 1" do
        let(:y) { '-2' }

        it "#valid? returns false" do
          expect(validator).to_not be_valid
        end
      end
    end
  end

  context "uses current_image" do
    let(:image) { instance_double("Image", row_size: 2, column_size: 2) }

    subject(:validator) { described_class.new(x, y, image) }


    context "boundaries are set from current_image" do
      it "#valid? returns false" do
        expect(validator).to_not be_valid
      end
    end
    context "valid coordinate" do
      let(:x) { '2' }
      let(:y) { '2' }

      it "#valid? returns true" do
        expect(validator).to be_valid
      end
    end
  end
end
