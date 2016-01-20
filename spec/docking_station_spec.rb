

require 'DockingStation.rb'
=begin ###
describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end
=end
describe DockingStation do
  it {is_expected.to respond_to :release_bike}

describe '#dock' do

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
  it 'raises an error when capacity is full' do
    bike = Bike.new
    subject.dock(bike)
    expect { subject.dock(bike) }.to raise_error 'full capacity'
  end

end



describe '#release_bike' do
  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'no bikes available'
  end

end



  it 'doesn\'t release a bike if none are available' do
    @bikes == 0
    expect {subject.release_bike}.to raise_error("no bikes available") if @bikes == 0
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
end

=begin
describe DockingStation do
  it 'is working' do
    bike = Bike.new
    expect(bike).to be_working
  end
end

=end



