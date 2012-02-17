require "spec_helper"

describe CardTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/card_types").should route_to("card_types#index")
    end

    it "routes to #new" do
      get("/card_types/new").should route_to("card_types#new")
    end

    it "routes to #show" do
      get("/card_types/1").should route_to("card_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/card_types/1/edit").should route_to("card_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/card_types").should route_to("card_types#create")
    end

    it "routes to #update" do
      put("/card_types/1").should route_to("card_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/card_types/1").should route_to("card_types#destroy", :id => "1")
    end

  end
end
