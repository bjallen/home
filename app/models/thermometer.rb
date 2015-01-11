class Thermometer < ActiveRecord::Base
  belongs_to :spark_core
  has_many :temperature_readings
  validates :room, :presence => true
end
