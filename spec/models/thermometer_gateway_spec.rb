require 'rails_helper'

RSpec.describe ThermometerGateway, :type => :model do
  let(:thermometer) { FactoryGirl.build_stubbed(:thermometer) }

  let(:fake_core) do
    double
  end

  it "requests the variable from spark" do
    device_id = thermometer.spark_core.device_id
    expect(RubySpark::Core).to receive(:new).with(device_id).and_return(fake_core)
    expect(fake_core).to receive(:variable).with("temperature").and_return(4.567)
    temp = ThermometerGateway.temperature_for(thermometer)
    expect(temp).to eq(4.567)
  end
end
