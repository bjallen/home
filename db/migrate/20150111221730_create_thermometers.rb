class CreateThermometers < ActiveRecord::Migration
  def change
    create_table :thermometers do |t|
      t.references :spark_core, index: true
      t.string :room

      t.timestamps null: false
    end
    add_foreign_key :thermometers, :spark_cores
  end
end
