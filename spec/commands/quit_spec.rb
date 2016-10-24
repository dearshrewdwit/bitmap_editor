require 'spec_helper'

RSpec.describe Commands::Quit do

  subject { described_class.new }

  describe "#process" do
    it "receives quit message" do
      expect(subject.process[:message]).to eq 'goodbye!'
    end
  end
end
