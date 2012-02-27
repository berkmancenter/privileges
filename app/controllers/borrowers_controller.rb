require 'csv'
require 'carmen'
include Carmen

class BorrowersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create, :confirmation]

  def index
    @general_event = Event.find(:first, :conditions => {:name => "Privileges"})
    @borrowers = Borrower.find(:all, :conditions => {:event_id => @general_event.id})

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @borrower = Borrower.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @borrower = Borrower.new
    @event = Event.find(params[:event_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @borrower = Borrower.find(params[:id])
    @event = @borrower.event
  end

  def create
    if params[:borrower][:event_id].nil?
      attendee = Attendee.find(:first, :conditions => {:email => params[:borrower][:email]})
      unless attendee.nil?
        @event = attendee.event
      else
        @event = Event.find(:first, :conditions => {:name => "Privileges"})
      end  
    else  
      @event = Event.find(params[:borrower][:event_id])
    end  

    params[:borrower][:event_id] = @event.id
    if params[:borrower][:start_date].empty?
      params[:borrower][:start_date] = @event.start_date
    else
      params[:borrower][:start_date] = Date.strptime(params[:borrower][:start_date], "%m/%d/%Y")
    end  
    if params[:borrower][:end_date].empty?
      params[:borrower][:end_date] = @event.end_date
    else
      params[:borrower][:end_date] = Date.strptime(params[:borrower][:end_date], "%m/%d/%Y")    
    end
    
    #strip all non numbers out of phone
    params[:borrower][:phone] = params[:borrower][:phone].gsub(/[^0-9]/, "")
    
    @borrower = Borrower.new(params[:borrower])
    respond_to do |format|
      if @borrower.save
        node_path = NodePath.new
        node_path.path = session[:node_path]
        node_path.borrower_id = @borrower.id
        node_path.session_id = session[:id]
        node_path.save
        #clear node_path session variable
        session[:node_path] = nil
        
        if current_user.try(:admin?)
          format.html { redirect_to borrowers_url, notice: 'Borrower was successfully created.' }    
        else
          format.html { redirect_to confirmation_borrowers_url(:id => @borrower.id), notice: 'Your information was successfully submitted.' }
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @borrower = Borrower.find(params[:id])
    params[:borrower][:start_date] = Date.strptime(params[:borrower][:start_date], "%m/%d/%Y")
    params[:borrower][:end_date] = Date.strptime(params[:borrower][:end_date], "%m/%d/%Y")
    #strip all non numbers out of phone
    params[:borrower][:phone] = params[:borrower][:phone].gsub(/[^0-9]/, "")
    
    respond_to do |format|
      if @borrower.update_attributes(params[:borrower])
        if @borrower.event.is_general?
          format.html { redirect_to borrowers_url, notice: 'Borrower was successfully updated.' }
        else
          format.html { redirect_to event_url(@borrower.event), notice: 'Borrower was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @borrower = Borrower.find(params[:id])
    @event = @borrower.event
    @borrower.destroy

    respond_to do |format|
      format.html { redirect_to event_url(@event) }
    end
  end
  
  def import
    event = params[:event_id]
    unless params[:upload].blank?
      @file = params[:upload][:datafile]
      CSV.parse(@file.read).each do |cell|
          borrower={}
          borrower[:event_id] = event
          borrower[:firstname] = cell[0]
          borrower[:middlename] = cell[1]
          borrower[:lastname] = cell[2]
          borrower[:email] = cell[3]
          borrower[:phone] = cell[4]
          borrower[:start_date] = cell[5]
          borrower[:end_date] = cell[6]
        
          @borrower = Borrower.new
          @borrower.attributes = borrower
          @borrower.save
      end
      redirect_to event_url(event)
    else
      redirect_to event_url(event), notice: 'No File Chosen'
    end    
  end
  
  def confirmation
    @borrower = Borrower.find(params[:id])
  end
  
  def country_select
    begin
       country = Carmen::country_code(params[:id])
       @states = Carmen::states(country)
    rescue
       @states = nil
    end
    render :partial => "states"
  end
end
