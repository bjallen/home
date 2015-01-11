require 'rails_helper'

RSpec.describe "thermometers/edit", :type => :view do
  before(:each) do
    @thermometer = assign(:thermometer, FactoryGirl.build_stubbed(:thermometer))
    assign(:spark_cores, FactoryGirl.build_stubbed_list(:spark_core, 2))
  end

  it "renders the edit thermometer form" do
    render
    assert_select("form[action=?][method=?]", thermometer_path(@thermometer), "post") do
      assert_select("select#thermometer_spark_core_id[name=?]", "thermometer[spark_core_id]")
      assert_select("input#thermometer_room[name=?]", "thermometer[room]")
    end
  end
end
