class Thermometer < ActiveRecord::Base
  belongs_to :spark_core
  validates :room, :presence => true
end
