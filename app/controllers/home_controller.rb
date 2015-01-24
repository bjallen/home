class HomeController < ApplicationController
  def index
    @thermometers = Thermometer.all
  end
end
