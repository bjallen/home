require 'rails_helper'

RSpec.describe "spark_cores/new", :type => :view do
  before(:each) { assign(:spark_core, SparkCore.new) }

  it "renders new spark_core form" do
    render
    assert_select("form[action=?][method=?]", spark_cores_path, "post") do
      assert_select("input#spark_core_device_id[name=?]", "spark_core[device_id]")
      assert_select("input#spark_core_name[name=?]", "spark_core[name]")
    end
  end
end
