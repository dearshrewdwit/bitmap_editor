require 'spec_helper'
RSpec.describe "#show_image" do
  let(:image) { Image.new }
  before { image.new_image(3, 3) }

  it "outputs correctly to STDOUT" do
    expect { image.show_image }.to output("OOO\nOOO\nOOO\n").to_stdout
  end
end
