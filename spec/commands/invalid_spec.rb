require 'spec_helper'

RSpec.describe Commands::Invalid do

  subject { described_class.new }

  describe "#process" do
    it "receives invalid message" do
      expect(subject.process[:message]).to eq 'unrecognised command :('
    end
  end
end
