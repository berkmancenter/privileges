require "spec_helper"

describe NodePathsController do
  describe "routing" do

    it "routes to #index" do
      get("/node_paths").should route_to("node_paths#index")
    end

    it "routes to #new" do
      get("/node_paths/new").should route_to("node_paths#new")
    end

    it "routes to #show" do
      get("/node_paths/1").should route_to("node_paths#show", :id => "1")
    end

    it "routes to #edit" do
      get("/node_paths/1/edit").should route_to("node_paths#edit", :id => "1")
    end

    it "routes to #create" do
      post("/node_paths").should route_to("node_paths#create")
    end

    it "routes to #update" do
      put("/node_paths/1").should route_to("node_paths#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/node_paths/1").should route_to("node_paths#destroy", :id => "1")
    end

  end
end
