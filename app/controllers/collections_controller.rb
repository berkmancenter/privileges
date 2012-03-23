class CollectionsController < ApplicationController

  def index
    @collections = Collection.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def create
    @collection = Collection.new(params[:collection])

    respond_to do |format|
      if @collection.save
        format.html { redirect_to collections_url, notice: 'Collection was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to collections_url, notice: 'Collection was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy

    respond_to do |format|
      format.html { redirect_to collections_url }
    end
  end
end
