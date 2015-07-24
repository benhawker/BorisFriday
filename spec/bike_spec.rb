require 'bike'

describe Bike do
it{is_expected.to respond_to :working?}

it "is able to report a broken bike" do
	subject.report_broken 
	expect(subject.working?).to eq false 
end


end