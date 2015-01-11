require 'rails_helper'

RSpec.describe "thermometers/new", :type => :view do
  before(:each) do
    assign(:thermometer, Thermometer.new)
    assign(:spark_cores, FactoryGirl.build_stubbed_list(:spark_core, 2))
  end

  it "renders new thermometer form" do
    render
    assert_select("form[action=?][method=?]", thermometers_path, "post") do
      assert_select("select#thermometer_spark_core_id[name=?]", "thermometer[spark_core_id]")
      assert_select("input#thermometer_room[name=?]", "thermometer[room]")
    end
  end
end
