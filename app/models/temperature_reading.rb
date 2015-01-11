class TemperatureReading < ActiveRecord::Base
  belongs_to :thermometer
  validates :temperature, :thermometer,
            :presence => true
end
