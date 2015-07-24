require 'docking_station'

describe DockingStation do
	it{is_expected.to respond_to :release_bike}

	it "releases a working bike" do
		subject.dock Bike.new
    bike = subject.release_bike
		expect(bike).to be_working
	end

  it "is able to change capacity to a custom" do
    new_station = DockingStation.new(50)
    expect(new_station.capacity).to eq 50
  end

  describe "#release_bike" do
    it 'raises an error if there are no bikes available' do
    expect{subject.release_bike}.to raise_error("No bikes - disaster!")
    end
    it 'will not release a broken bike' do
      bike = Bike.new
      bike.report_broken
      subject.dock bike
      expect { subject.release_bike }.to raise_error('Bike is broken')
    end
  end


	it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#dock' do
    it 'raises an error if station is full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error('Station is full!')
    end
  end

  it 'has a default capacity Constant' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
