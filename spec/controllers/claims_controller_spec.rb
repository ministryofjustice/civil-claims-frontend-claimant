require 'spec_helper'

describe ClaimsController do
  let(:valid_attributes) { {street: "102"} }
  let(:valid_session) { {} }

  describe "GET new" do
    it "assigns a new property as @property" do
      get :new, {}, valid_session
      assigns(:property).should be_a_new(Property)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Property" do
        #expect {
        #  post :create, {:property => valid_attributes}, valid_session
        #}.to change(Property, :count).by(1)
        post :create, {:property => valid_attributes}, valid_session
        assigns(:property).should be_a_new(Property)
      end

      it "assigns a newly created property as @property" do
        pending
        post :create, {:property => valid_attributes}, valid_session
        assigns(:property).should be_a(Property)
        assigns(:property).should be_persisted
      end
    end
  end
end
