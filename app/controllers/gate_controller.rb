class GateController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :verify_client_token

  def trigger
    core = RubySpark::Core.new(ENV["GATE_DEVICE_ID"])
    core.function("relay", "trigger")
  end

  private

  def verify_client_token
    head :unauthorized unless params[:access_token] == ENV["CLIENT_API_KEY"]
  end
end
