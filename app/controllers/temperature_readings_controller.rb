class TemperatureReadingsController < ApplicationController

  def index
    thermometer = Thermometer.find(params[:thermometer_id])
    query = GroupedTemperatureReadingsQuery.new(thermometer)
    @avg_temp_by_time = query.group_by(:hour)
  end

end
