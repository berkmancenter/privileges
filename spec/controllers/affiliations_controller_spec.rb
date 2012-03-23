require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AffiliationsController do

  # This should return the minimal set of attributes required to create a valid
  # Affiliation. As you add validations to Affiliation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AffiliationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all affiliations as @affiliations" do
      affiliation = Affiliation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:affiliations).should eq([affiliation])
    end
  end

  describe "GET show" do
    it "assigns the requested affiliation as @affiliation" do
      affiliation = Affiliation.create! valid_attributes
      get :show, {:id => affiliation.to_param}, valid_session
      assigns(:affiliation).should eq(affiliation)
    end
  end

  describe "GET new" do
    it "assigns a new affiliation as @affiliation" do
      get :new, {}, valid_session
      assigns(:affiliation).should be_a_new(Affiliation)
    end
  end

  describe "GET edit" do
    it "assigns the requested affiliation as @affiliation" do
      affiliation = Affiliation.create! valid_attributes
      get :edit, {:id => affiliation.to_param}, valid_session
      assigns(:affiliation).should eq(affiliation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Affiliation" do
        expect {
          post :create, {:affiliation => valid_attributes}, valid_session
        }.to change(Affiliation, :count).by(1)
      end

      it "assigns a newly created affiliation as @affiliation" do
        post :create, {:affiliation => valid_attributes}, valid_session
        assigns(:affiliation).should be_a(Affiliation)
        assigns(:affiliation).should be_persisted
      end

      it "redirects to the created affiliation" do
        post :create, {:affiliation => valid_attributes}, valid_session
        response.should redirect_to(Affiliation.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved affiliation as @affiliation" do
        # Trigger the behavior that occurs when invalid params are submitted
        Affiliation.any_instance.stub(:save).and_return(false)
        post :create, {:affiliation => {}}, valid_session
        assigns(:affiliation).should be_a_new(Affiliation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Affiliation.any_instance.stub(:save).and_return(false)
        post :create, {:affiliation => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested affiliation" do
        affiliation = Affiliation.create! valid_attributes
        # Assuming there are no other affiliations in the database, this
        # specifies that the Affiliation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Affiliation.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => affiliation.to_param, :affiliation => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested affiliation as @affiliation" do
        affiliation = Affiliation.create! valid_attributes
        put :update, {:id => affiliation.to_param, :affiliation => valid_attributes}, valid_session
        assigns(:affiliation).should eq(affiliation)
      end

      it "redirects to the affiliation" do
        affiliation = Affiliation.create! valid_attributes
        put :update, {:id => affiliation.to_param, :affiliation => valid_attributes}, valid_session
        response.should redirect_to(affiliation)
      end
    end

    describe "with invalid params" do
      it "assigns the affiliation as @affiliation" do
        affiliation = Affiliation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Affiliation.any_instance.stub(:save).and_return(false)
        put :update, {:id => affiliation.to_param, :affiliation => {}}, valid_session
        assigns(:affiliation).should eq(affiliation)
      end

      it "re-renders the 'edit' template" do
        affiliation = Affiliation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Affiliation.any_instance.stub(:save).and_return(false)
        put :update, {:id => affiliation.to_param, :affiliation => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested affiliation" do
      affiliation = Affiliation.create! valid_attributes
      expect {
        delete :destroy, {:id => affiliation.to_param}, valid_session
      }.to change(Affiliation, :count).by(-1)
    end

    it "redirects to the affiliations list" do
      affiliation = Affiliation.create! valid_attributes
      delete :destroy, {:id => affiliation.to_param}, valid_session
      response.should redirect_to(affiliations_url)
    end
  end

end