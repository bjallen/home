class SparkCoresController < ApplicationController
  before_action :set_spark_core, only: [:edit, :update, :destroy]

  def index
    @spark_cores = SparkCore.all
  end

  def new
    @spark_core = SparkCore.new
  end

  def create
    @spark_core = SparkCore.new(spark_core_params)

    respond_to do |format|
      if @spark_core.save
        format.html { redirect_to spark_cores_url, notice: 'Spark core was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @spark_core.update(spark_core_params)
        format.html { redirect_to spark_cores_url, notice: 'Spark core was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @spark_core.destroy
    respond_to do |format|
      format.html { redirect_to spark_cores_url, notice: 'Spark core was successfully destroyed.' }
    end
  end

  private

  def set_spark_core
    @spark_core = SparkCore.find(params[:id])
  end

  def spark_core_params
    params.require(:spark_core).permit(:device_id, :name)
  end
end
