require 'rails_helper'

RSpec.describe TemperatureReading, :type => :model do
  context "temperature validation" do
    let(:reading) { TemperatureReading.new }

    it "is invalid" do
      expect(reading).to be_invalid
    end

    it "has an error on temperature" do
      reading.validate
      expect(reading.errors[:temperature].size).to eq(1)
    end
  end
end
