require 'docking_station'

describe DockingStation do
	let(:bike) {double(:bike, :working => true)}



	it "checks bike is working" do
		subject.dock(bike)
		expect(subject.release_bike.working).to eq true
	end

	describe "#release_bike" do
		it {is_expected.to respond_to :release_bike}

		it "declares bike has been released" do
			subject.dock(bike) #subject == DockingStation.new
			expect(subject.release_bike).to eq bike
		end

		it "raises an error when there are no bikes available" do
			expect {subject.release_bike}.to raise_error("no bike available")
		end
	end

	describe "#dock" do
		it "return bike has one argument" do
			expect(subject).to respond_to(:dock).with(1).argument
		end

		it "docks a bike" do
			expect(subject.dock(bike)).to eq [bike]
		end

		it "allows us to dock #{DockingStation::DEFAULT_CAPACITY} bikes before an error is raised" do
			subject.capacity.times { subject.dock(double(:bike)) }
			expect {subject.dock(double(:bike))}.to raise_error("warning #{subject.capacity} bikes already docked")
		end

		it "doesn't release broken bikes" do
			allow(bike).to receive(:working).and_return(false)
			subject.dock(bike)
			expect {subject.release_bike}.to raise_error("no bike available")
		end

		it "skips broken bikes" do
			bike_2 = double(:bike, :working => false)
		  subject.dock(bike)
			subject.dock(bike_2)
			expect(subject.release_bike).to eq bike
		end
	end



	describe '.initialize' do
		it "has a default capacity" do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
		end

		it "can have a set capacity" do
			ds = DockingStation.new(30)
			expect(ds.capacity).to eq 30
		end
	end

end