require 'csv'

class AttendeesController < ApplicationController
  before_filter :authenticate_user!
    
  def show
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @attendee = Attendee.new
    @event = Event.find(params[:event_id])

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @attendee = Attendee.find(params[:id])
    @event = @attendee.event
  end

  def create
    params[:attendee][:start_date] = Date.strptime(params[:attendee][:start_date], "%m/%d/%Y")
    params[:attendee][:end_date] = Date.strptime(params[:attendee][:end_date], "%m/%d/%Y")
    @attendee = Attendee.new(params[:attendee])
    
    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @attendee = Attendee.find(params[:id])
    params[:attendee][:start_date] = Date.strptime(params[:attendee][:start_date], "%m/%d/%Y")
    params[:attendee][:end_date] = Date.strptime(params[:attendee][:end_date], "%m/%d/%Y")
    
    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        borrower = Borrower.find(:first, :conditions => {:attendee_id => @attendee.id})
        unless borrower.nil?
          borrower.start_date = @attendee.start_date
          borrower.end_date = @attendee.end_date
          borrower.save
        end  
        format.html { redirect_to Event.find(@attendee.event_id), notice: 'Attendee was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to attendees_url }
    end
  end
  
  def import
    event = Event.find(params[:event_id])
    unless params[:upload].blank?
      @file = params[:upload][:datafile]
      CSV.parse(@file.read).each do |cell|
          attendee={}
          attendee[:event_id] = event.id
          attendee[:firstname] = cell[0]
          attendee[:lastname] = cell[1]
          attendee[:email] = cell[2]
          attendee[:start_date] = event.start_date
          attendee[:end_date] = event.end_date
        
          @attendee = Attendee.new
          @attendee.attributes = attendee
          @attendee.save
      end
      redirect_to event_url(event)
    else
      redirect_to event_url(event), notice: 'No File Chosen'
    end    
  end
end
