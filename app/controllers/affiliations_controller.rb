class AffiliationsController < ApplicationController

  def index
    @affiliations = Affiliation.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @affiliation = Affiliation.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @affiliation = Affiliation.find(params[:id])
  end

  def create
    @affiliation = Affiliation.new(params[:affiliation])

    respond_to do |format|
      if @affiliation.save
        format.html { redirect_to affiliations_url, notice: 'Affiliation was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @affiliation = Affiliation.find(params[:id])

    respond_to do |format|
      if @affiliation.update_attributes(params[:affiliation])
        format.html { redirect_to affiliations_url, notice: 'Affiliation was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @affiliation = Affiliation.find(params[:id])
    @affiliation.destroy

    respond_to do |format|
      format.html { redirect_to affiliations_url }
      format.json { head :no_content }
    end
  end
end
