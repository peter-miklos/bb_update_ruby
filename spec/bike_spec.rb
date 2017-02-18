require "bike"

describe Bike do

  let(:bike) { described_class.new }

  describe "working?" do
    it "responds true for a working bike" do
      expect(bike.working?).to eq true
    end

    it "responds false for a broken bike" do
      bike.set_broken
      expect(bike.working?).to eq false
    end

  end

  describe "set_broken" do

    it "set the condition to broken" do
      bike.set_broken
      expect(bike.working?).to eq false
    end

    it "raises error if the condition is already broken" do
      bike.set_broken
      expect{bike.set_broken}.to raise_error("The bike is already broken")
    end
  end
end
