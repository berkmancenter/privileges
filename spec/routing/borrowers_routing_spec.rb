require "spec_helper"

describe BorrowersController do
  describe "routing" do

    it "routes to #index" do
      get("/borrowers").should route_to("borrowers#index")
    end

    it "routes to #new" do
      get("/borrowers/new").should route_to("borrowers#new")
    end

    it "routes to #show" do
      get("/borrowers/1").should route_to("borrowers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/borrowers/1/edit").should route_to("borrowers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/borrowers").should route_to("borrowers#create")
    end

    it "routes to #update" do
      put("/borrowers/1").should route_to("borrowers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/borrowers/1").should route_to("borrowers#destroy", :id => "1")
    end

  end
end
