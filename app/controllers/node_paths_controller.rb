class NodePathsController < ApplicationController
  # GET /node_paths
  # GET /node_paths.json
  def index
    @node_paths = NodePath.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @node_paths }
    end
  end

  # GET /node_paths/1
  # GET /node_paths/1.json
  def show
    @node_path = NodePath.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node_path }
    end
  end

  # GET /node_paths/new
  # GET /node_paths/new.json
  def new
    @node_path = NodePath.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @node_path }
    end
  end

  # GET /node_paths/1/edit
  def edit
    @node_path = NodePath.find(params[:id])
  end

  # POST /node_paths
  # POST /node_paths.json
  def create
    @node_path = NodePath.new(params[:node_path])

    respond_to do |format|
      if @node_path.save
        format.html { redirect_to @node_path, notice: 'Node path was successfully created.' }
        format.json { render json: @node_path, status: :created, location: @node_path }
      else
        format.html { render action: "new" }
        format.json { render json: @node_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /node_paths/1
  # PUT /node_paths/1.json
  def update
    @node_path = NodePath.find(params[:id])

    respond_to do |format|
      if @node_path.update_attributes(params[:node_path])
        format.html { redirect_to @node_path, notice: 'Node path was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @node_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /node_paths/1
  # DELETE /node_paths/1.json
  def destroy
    @node_path = NodePath.find(params[:id])
    @node_path.destroy

    respond_to do |format|
      format.html { redirect_to node_paths_url }
      format.json { head :no_content }
    end
  end
end
