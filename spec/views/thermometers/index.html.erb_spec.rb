require 'rails_helper'

RSpec.describe "thermometers/index", :type => :view do
  before(:each) do
    assign(:thermometers, FactoryGirl.build_stubbed_list(:thermometer, 2))
  end

  it "renders a list of thermometers" do
    render
    assert_select("tr>td", :text => "maple", :count => 2)
    assert_select("tr>td", :text => "Guest Bedroom", :count => 2)
  end
end
