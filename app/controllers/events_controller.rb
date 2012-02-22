class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.try(:admin?)
      @events = Event.all
    elsif user_signed_in?
      @events = Event.find(:all, :conditions => {:user_id => current_user.id}) 
    end      

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    params[:event][:start_date] = Date.strptime(params[:event][:start_date], "%m/%d/%Y")
    params[:event][:end_date] = Date.strptime(params[:event][:end_date], "%m/%d/%Y")
    @event = Event.new(params[:event])
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: 'Event was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    params[:event][:start_date] = Date.strptime(params[:event][:start_date], "%m/%d/%Y")
    params[:event][:end_date] = Date.strptime(params[:event][:end_date], "%m/%d/%Y")
    
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
    end
  end
end
