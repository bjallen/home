require 'rails_helper'

RSpec.describe TemperatureReadingsHelper, :type => :helper do
  it "converts celsius to fahrenheit" do
    expect(helper.convert_celsius_to_fahrenheit(16.23456) ).to eq(61.2)
  end
end
