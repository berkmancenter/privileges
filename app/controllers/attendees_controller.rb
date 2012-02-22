class AttendeesController < ApplicationController
  before_filter :authenticate_user!
    
  def show
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendee }
    end
  end

  def new
    @attendee = Attendee.new
    @event = Event.find(params[:event_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendee }
    end
  end

  def edit
    @attendee = Attendee.find(params[:id])
    @event = @attendee.event
  end

  def create
    @attendee = Attendee.new(params[:attendee])

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
        format.json { render json: @attendee, status: :created, location: @attendee }
      else
        format.html { render action: "new" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @attendee = Attendee.find(params[:id])

    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to @attendee, notice: 'Attendee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy

    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end
  
  def import
    event = params[:event_id]
    unless params[:upload].blank?
      @file = params[:upload][:datafile]
      CSV.parse(@file.read).each do |cell|
          attendee={}
          attendee[:event_id] = event
          attendee[:firstname] = cell[0]
          attendee[:lastname] = cell[1]
          attendee[:email] = cell[2]
        
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
