require 'docking_station'

describe DockingStation do
  subject {described_class.new}

  let (:working_bike) { double :working_bike }
  let (:broken_bike) { double :broken_bike }

  before(:each) do
    allow(working_bike).to receive(:working?).and_return(true)
    allow(broken_bike).to receive(:working?).and_return(false)
  end

  describe "release_bike" do
    it "releases a workning bike" do
      subject.dock(working_bike)
      released_bike = subject.release_bike
      expect(released_bike).to eq working_bike
    end

    it "does not release a broken bike" do
      subject.dock(working_bike)
      subject.dock(broken_bike)
      released_bike = subject.release_bike
      expect(released_bike).to eq working_bike
      expect(released_bike).not_to eq broken_bike
    end

    it "returns an error message if no working bike available" do
      subject.dock(broken_bike)
      expect{subject.release_bike}.to raise_error("No more bike available")
    end
  end

end
