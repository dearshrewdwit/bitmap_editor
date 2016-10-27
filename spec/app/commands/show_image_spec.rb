require 'spec_helper'

RSpec.describe Commands::ShowImage do

  subject { described_class.new(input) }
  let(:current_image) { [%w(O O O), %w(O O O), %w(O O O), %w(O O O )] }

  context "valid input" do
    let(:input) { 'S' }
    it "#valid? returns false without current_image" do
      expect(subject).to_not be_valid
    end
    it "#valid? returns true with current_image" do
      allow(subject).to receive(:current_image).and_return current_image
      expect(subject).to be_valid
    end
    it "#process returns joined array" do
      allow(subject).to receive(:current_image).and_return current_image
      expect(subject.process[:message]).to eq current_image.map { |i| i.join }
    end
  end

  context "invalid input" do
    let(:input) { 'I24' }
    it "#valid? returns false" do
      expect(subject).to_not be_valid
    end
  end
end
