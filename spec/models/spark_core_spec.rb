require 'rails_helper'

RSpec.describe SparkCore, :type => :model do
  context "name validation" do
    let(:core) { SparkCore.new({ :device_id => "1234asdf" }) }

    it "is invalid" do
      expect(core).to be_invalid
    end

    it "has an error on name" do
      core.validate
      expect(core.errors[:name].size).to eq(1)
    end
  end

  context "device_id validation" do
    let(:core) { SparkCore.new({ :name => "whammy" }) }

    it "is invalid" do
      expect(core).to be_invalid
    end

    it "has an error on name" do
      core.validate
      expect(core.errors[:device_id].size).to eq(1)
    end
  end
end
