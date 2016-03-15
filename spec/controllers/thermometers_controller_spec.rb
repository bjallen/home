require 'rails_helper'

RSpec.describe ThermometersController, :type => :controller do
  let(:valid_attributes) do
    { :room => 'Kitchen' }
  end

  let(:invalid_attributes) do
    { :room => '' }
  end

  describe "GET index" do
    it "assigns all thermometers as @thermometers" do
      thermometers = FactoryGirl.build_stubbed_list(:thermometer, 3)
      expect(Thermometer).to receive(:all).and_return(thermometers)
      get :index
      expect(assigns(:thermometers)).to eq(thermometers)
    end
  end

  describe "GET new" do
    it "assigns a new thermometer as @thermometer" do
      get :new
      expect(assigns(:thermometer)).to be_a_new(Thermometer)
    end
  end

  describe "GET edit" do
    it "assigns the requested thermometer as @thermometer" do
      thermometer = FactoryGirl.build_stubbed(:thermometer)
      expect(Thermometer).to receive(:find)
                              .with(thermometer.to_param)
                              .and_return(thermometer)

      get :edit, :params => { :id => thermometer.to_param }
      expect(assigns(:thermometer)).to eq(thermometer)
    end
  end

  describe "POST create" do
    let(:thermometer) { Thermometer.new }

    describe "with valid params" do
      it "redirects to the thermometers index" do
        expect(Thermometer).to receive(:new)
                                .with(ActionController::Parameters.new(valid_attributes).permit!)
                                .and_return(thermometer)
        expect(thermometer).to receive(:save).and_return(true)
        post :create, :params => { :thermometer => valid_attributes }
        expect(response).to redirect_to(thermometers_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved thermometer as @thermometer" do
        expect(Thermometer).to receive(:new)
                                .with(ActionController::Parameters.new(invalid_attributes).permit!)
                                .and_return(thermometer)
        post :create, :params => { :thermometer => invalid_attributes }
        expect(assigns(:thermometer)).to be(thermometer)
      end

      it "re-renders the 'new' template" do
        expect(Thermometer).to receive(:new)
                                .with(ActionController::Parameters.new(invalid_attributes).permit!)
                                .and_return(thermometer)
        expect(thermometer).to receive(:save).and_return(false)
        post :create, :params => { :thermometer => invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    let(:thermometer) { FactoryGirl.build_stubbed(:thermometer) }

    it "destroys the requested thermometer" do
      expect(Thermometer).to receive(:find)
                              .with(thermometer.to_param)
                              .and_return(thermometer)
      expect(thermometer).to receive(:destroy)
      delete :destroy, :params => { :id => thermometer.to_param }
    end

    it "redirects to the thermometers list" do
      expect(Thermometer).to receive(:find)
                              .with(thermometer.to_param)
                              .and_return(thermometer)
      expect(thermometer).to receive(:destroy)
      delete :destroy, :params => { :id => thermometer.to_param }
      expect(response).to redirect_to(thermometers_url)
    end
  end
end
