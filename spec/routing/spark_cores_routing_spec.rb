require "rails_helper"

RSpec.describe SparkCoresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/spark_cores").to route_to("spark_cores#index")
    end

    it "routes to #new" do
      expect(:get => "/spark_cores/new").to route_to("spark_cores#new")
    end

    it "routes to #edit" do
      expect(:get => "/spark_cores/1/edit").to route_to("spark_cores#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/spark_cores").to route_to("spark_cores#create")
    end

    it "routes to #update" do
      expect(:put => "/spark_cores/1").to route_to("spark_cores#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/spark_cores/1").to route_to("spark_cores#destroy", :id => "1")
    end

  end
end
