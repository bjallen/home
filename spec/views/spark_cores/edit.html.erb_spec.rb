require 'rails_helper'

RSpec.describe "spark_cores/edit", :type => :view do
  before(:each) do
    @spark_core = assign(:spark_core, FactoryGirl.build_stubbed(:spark_core))
  end

  it "renders the edit spark_core form" do
    render
    assert_select("form[action=?][method=?]", spark_core_path(@spark_core), "post") do
      assert_select("input#spark_core_device_id[name=?]", "spark_core[device_id]")
      assert_select("input#spark_core_name[name=?]", "spark_core[name]")
    end
  end
end
