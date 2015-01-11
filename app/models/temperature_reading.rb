class TemperatureReading < ActiveRecord::Base
    validates :temperature, :presence => true
end
