require 'rails_helper'

RSpec.describe TemperatureReadingsController, :type => :controller do
  include ActiveSupport::Testing::TimeHelpers

  let(:thermometer) { instance_double(Thermometer) }
  let(:query) { instance_double(TemperatureReadingsQuery) }

  describe "GET index" do
    it "assigns grouped temps as as @avg_temp_by_time" do
      travel_to(1.day.ago) do
        readings = double
        expect(Thermometer).to receive(:find).with("1").and_return(thermometer)
        expect(TemperatureReadingsQuery).to receive(:new).with(thermometer, 24.hours.ago).and_return(query)
        expect(query).to receive(:avg_temp_grouped_by).and_return(readings)
        get :index, :thermometer_id => 1, :unit => "hour", :format => :json
        expect(assigns(:avg_temp_by_time)).to eq(readings)
      end
    end
  end
end
