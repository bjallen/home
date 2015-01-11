class CreateSparkCores < ActiveRecord::Migration
  def change
    create_table :spark_cores do |t|
      t.string :device_id
      t.string :name

      t.timestamps null: false
    end
  end
end
