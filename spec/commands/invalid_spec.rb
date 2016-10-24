require 'spec_helper'

RSpec.describe Commands::Invalid do

  subject { described_class.new }

  describe "#process" do
    it "receives invalid message" do
      expect(subject.process[:message]).to eq 'unrecognised command :('
    end
  end
  describe "#valid" do
    it "returns true by default" do
      expect(subject).to be_valid
    end
  end
end
