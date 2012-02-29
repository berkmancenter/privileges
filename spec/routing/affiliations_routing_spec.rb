require "spec_helper"

describe AffiliationsController do
  describe "routing" do

    it "routes to #index" do
      get("/affiliations").should route_to("affiliations#index")
    end

    it "routes to #new" do
      get("/affiliations/new").should route_to("affiliations#new")
    end

    it "routes to #show" do
      get("/affiliations/1").should route_to("affiliations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/affiliations/1/edit").should route_to("affiliations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/affiliations").should route_to("affiliations#create")
    end

    it "routes to #update" do
      put("/affiliations/1").should route_to("affiliations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/affiliations/1").should route_to("affiliations#destroy", :id => "1")
    end

  end
end
