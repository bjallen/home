class ThermometersController < ApplicationController
  before_action :set_thermometer, :only => [:edit, :update, :destroy]
  before_action :set_spark_cores, :except => [:index, :destroy]

  def index
    @thermometers = Thermometer.all
  end

  def new
    @thermometer = Thermometer.new
  end

  def edit
  end

  def create
    @thermometer = Thermometer.new(thermometer_params)

    respond_to do |format|
      if @thermometer.save
        format.html { redirect_to thermometers_url, notice: 'Thermometer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @thermometer.update(thermometer_params)
        format.html { redirect_to thermometers_url, notice: 'Thermometer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @thermometer.destroy
    respond_to do |format|
      format.html { redirect_to thermometers_url, notice: 'Thermometer was successfully destroyed.' }
    end
  end

  private

  def set_thermometer
    @thermometer = Thermometer.find(params[:id])
  end

  def set_spark_cores
    @spark_cores = SparkCore.all
  end

  def thermometer_params
    params.require(:thermometer).permit(:spark_core_id, :room)
  end
end
