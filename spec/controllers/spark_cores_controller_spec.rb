require 'rails_helper'

RSpec.describe SparkCoresController, :type => :controller do
  let(:valid_attributes) do
    { :name => 'thingy', :device_id => '123abc' }
  end

  let(:invalid_attributes) do
    { :name => '', :device_id => '' }
  end

  describe "GET index" do
    it "assigns all spark_cores as @spark_cores" do
      cores = FactoryGirl.build_stubbed_list(:spark_core, 3)
      expect(SparkCore).to receive(:all).and_return(cores)
      get :index
      expect(assigns(:spark_cores)).to eq(cores)
    end
  end

  describe "GET new" do
    it "assigns a new spark_core as @spark_core" do
      get :new
      expect(assigns(:spark_core)).to be_a_new(SparkCore)
    end
  end

  describe "GET edit" do
    it "assigns the requested spark_core as @spark_core" do
      spark_core = FactoryGirl.build_stubbed(:spark_core)
      expect(SparkCore).to receive(:find)
                            .with(spark_core.to_param)
                            .and_return(spark_core)

      get :edit, :params => { :id => spark_core.to_param }
      expect(assigns(:spark_core)).to eq(spark_core)
    end
  end

  describe "POST create" do
    let(:core) { SparkCore.new }

    describe "with valid params" do
      it "redirects to the spark_core index" do
        expect(SparkCore).to receive(:new)
                              .with(ActionController::Parameters.new(valid_attributes).permit!)
                              .and_return(core)
        expect(core).to receive(:save).and_return(true)
        post :create, :params => { :spark_core => valid_attributes }
        expect(response).to redirect_to(spark_cores_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved spark_core as @spark_core" do
        expect(SparkCore).to receive(:new)
                              .with(ActionController::Parameters.new(invalid_attributes).permit!)
                              .and_return(core)
        post :create, :params => { :spark_core => invalid_attributes }
        expect(assigns(:spark_core)).to be(core)
      end

      it "re-renders the 'new' template" do
        expect(SparkCore).to receive(:new)
                              .with(ActionController::Parameters.new(invalid_attributes).permit!)
                              .and_return(core)
        expect(core).to receive(:save).and_return(false)
        post :create, :params => { :spark_core => invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    let(:core) { FactoryGirl.build_stubbed(:spark_core) }

    it "destroys the requested spark_core" do
      expect(SparkCore).to receive(:find)
                            .with(core.to_param)
                            .and_return(core)
      expect(core).to receive(:destroy)
      delete :destroy, :params => { :id => core.to_param }
    end

    it "redirects to the spark_cores list" do
      expect(SparkCore).to receive(:find)
                            .with(core.to_param)
                            .and_return(core)
      expect(core).to receive(:destroy)
      delete :destroy, :params => { :id => core.to_param }
      expect(response).to redirect_to(spark_cores_url)
    end
  end
end
