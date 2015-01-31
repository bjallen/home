class TemperatureReadingsController < ApplicationController

  def index
    thermometer = Thermometer.find(params[:thermometer_id])
    query = TemperatureReadingsQuery.new(thermometer, 24.hours.ago)
    @avg_temp_by_time = query.avg_temp_grouped_by(:hour)
  end

end
