require 'spec_helper'

RSpec.describe Commands::Quit do
  let(:input) { 'X' }

  subject { described_class.new(input) }

  describe "#valid" do
    context "valid input" do
      it "returns true" do
        expect(subject).to be_valid
      end
    end
    context "invalid input" do
    let(:input) { 'Xextra characters' }
      it "returns false" do
        expect(subject).to_not be_valid
      end
    end
  end
  describe "#process" do
    it "returns message" do
      expect(subject.process[:message]).to eq 'goodbye!'
    end
  end
end
