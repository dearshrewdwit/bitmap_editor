require 'spec_helper'

RSpec.describe ImageHandler do
  subject(:handler) { described_class.new }

  before { handler.new_image(3, 3) }

  it "outputs correctly to STDOUT" do
    expect { handler.show_image }.to output("OOO\nOOO\nOOO\n").to_stdout
  end
end
