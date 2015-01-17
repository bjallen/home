require 'rails_helper'

RSpec.describe TemperatureReadingsController, :type => :controller do
  describe "GET index" do
    it "assigns grouped temps as as @avg_temp_by_time" do
      thermometer = double
      query = double
      readings = double
      expect(Thermometer).to receive(:find).with(1).and_return(thermometer)
      expect(GroupedTemperatureReadingsQuery).to receive(:new).with(thermometer).and_return(query)
      expect(query).to receive(:avg_temp_grouped_by).and_return(readings)
      get :index, :thermometer_id => 1, :unit => "hour", :format => :json
      expect(assigns(:avg_temp_by_time)).to eq(readings)
    end
  end
end
