require 'docking_station'

describe DockingStation do
  subject {described_class.new}

  let (:bike) { double :bike }

  describe "release_bike" do
    it "releases a bike" do
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to eq bike
    end
  end

end
