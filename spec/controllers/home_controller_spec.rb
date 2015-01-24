require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
  describe "GET index" do
    it "gets all thermometers" do
      expect(Thermometer).to receive(:all)
      get :index
    end
  end
end
