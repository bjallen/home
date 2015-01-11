require 'rails_helper'

RSpec.describe TemperatureReading, :type => :model do
  context "temperature validation" do
    let(:reading) { TemperatureReading.new({ :thermometer_id => 5 }) }

    it "is invalid" do
      expect(reading).to be_invalid
    end

    it "has an error on temperature" do
      reading.validate
      expect(reading.errors[:temperature].size).to eq(1)
    end
  end

  context "thermometer validation" do
    let(:reading) { TemperatureReading.new({ :temperature => 6 }) }

    it "is invalid" do
      expect(reading).to be_invalid
    end

    it "has an error on thermometer" do
      reading.validate
      expect(reading.errors[:thermometer].size).to eq(1)
    end
  end
end
