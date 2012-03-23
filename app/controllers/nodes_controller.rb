require 'csv'

class NodesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]
  
  def index
    @nodes = Node.all
    @firsts = Node.find(:all, :conditions => {:first => true})

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @node = Node.find(params[:id])
    
    #saving user's flow chart choices to include in borrower object
    unless session[:node_path].nil?
      session[:node_path] += "," + @node.id.to_s
    else
      session[:node_path] = @node.id.to_s  
    end  

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @node = Node.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @node = Node.find(params[:id])
  end

  def create
    @node = Node.new(params[:node])

    respond_to do |format|
      if @node.save
        format.html { redirect_to nodes_url, notice: 'Node was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @node = Node.find(params[:id])

    respond_to do |format|
      if @node.update_attributes(params[:node])
        format.html { redirect_to @node, notice: 'Node was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy
    
    respond_to do |format|
      flash[:notice] = %Q|Deleted node|
      format.html { redirect_to nodes_url }
    end
  end
  
  def import
    unless params[:upload].blank?
      @file = params[:upload][:datafile]
      CSV.parse(@file.read).each do |cell|
          node={}
          node[:text] = cell[0]
        
          @node = Node.new
          @node.attributes = node
          @node.save
      end
      redirect_to nodes_url
    else
      redirect_to nodes_url, notice: 'No File Chosen'
    end  
  end
  
end
