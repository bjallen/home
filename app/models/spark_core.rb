class SparkCore < ActiveRecord::Base
  validates :name, :device_id,
            :presence => true
end
