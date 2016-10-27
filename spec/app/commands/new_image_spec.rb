require 'spec_helper'

RSpec.describe Commands::NewImage do

  subject { described_class.new(input) }

  context "valid input" do
    let(:input) { 'I 3 4' }
    it "#valid? returns true" do
      expect(subject).to be_valid
    end
    it "returns image" do
      expect(subject.process[:image]).to eq [%w(O O O), %w(O O O), %w(O O O), %w(O O O )]
    end
  end

  context "invalid input" do
    context "missing coordinates" do
      let(:input) { 'I 24' }
      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
    context "too many coordinates" do
      let(:input) { 'I 24 100 2' }
      it "#valid? returns false" do
        expect(subject).to_not be_valid
      end
    end
  end
end
