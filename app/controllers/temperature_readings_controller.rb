class TemperatureReadingsController < ApplicationController

  def index
    thermometer = Thermometer.find(params[:thermometer_id])
    query = GroupedTemperatureReadingsQuery.new(thermometer)
    @avg_temp_by_time = query.avg_temp_grouped_by(:hour)
  end

end
