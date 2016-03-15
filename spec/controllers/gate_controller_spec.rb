require 'rails_helper'

RSpec.describe GateController, :type => :controller do
  describe "POST trigger" do
    it "calls the trigger function on the core" do
      fake_core = double
      expect(Particle).to receive(:device)
                                  .with(ENV["GATE_DEVICE_ID"])
                                  .and_return(fake_core)
      expect(fake_core).to receive(:function).with("relay", "trigger")
      api_key = ENV["CLIENT_API_KEY"]
      post :trigger, :params => { :access_token => api_key }
    end
  end
end
