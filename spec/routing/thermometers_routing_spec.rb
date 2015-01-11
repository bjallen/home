require "rails_helper"

RSpec.describe ThermometersController, :type => :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/thermometers").to route_to("thermometers#index")
    end

    it "routes to #new" do
      expect(:get => "/thermometers/new").to route_to("thermometers#new")
    end

    it "routes to #edit" do
      expect(:get => "/thermometers/1/edit").to route_to("thermometers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/thermometers").to route_to("thermometers#create")
    end

    it "routes to #update" do
      expect(:put => "/thermometers/1").to route_to("thermometers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/thermometers/1").to route_to("thermometers#destroy", :id => "1")
    end
  end
end
