require 'rails_helper'

RSpec.describe "spark_cores/index", :type => :view do
  before(:each) do
    assign(:spark_cores, FactoryGirl.build_stubbed_list(:spark_core, 2))
  end

  it "renders a list of spark_cores" do
    render
    assert_select("tr > td", :text => "1j482p324587yh3", :count => 2)
    assert_select("tr > td", :text => "maple", :count => 2)
  end
end
