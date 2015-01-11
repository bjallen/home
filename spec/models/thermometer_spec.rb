require 'rails_helper'

RSpec.describe Thermometer, :type => :model do
  context "room validation" do
    let(:thermometer) { Thermometer.new }

    it "is invalid" do
      expect(thermometer).to be_invalid
    end

    it "has an error on room" do
      thermometer.validate
      expect(thermometer.errors[:room].size).to eq(1)
    end
  end
end
