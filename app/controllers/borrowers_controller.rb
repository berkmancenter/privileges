require 'csv'
class BorrowersController < ApplicationController
  # GET /borrowers
  # GET /borrowers.json
  def index
    @general_event = Event.find(:first, :conditions => {:name => "Privileges"})
    @borrowers = Borrower.find(:all, :conditions => {:event_id => @general_event.id})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @borrowers }
    end
  end

  # GET /borrowers/1
  # GET /borrowers/1.json
  def show
    @borrower = Borrower.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @borrower }
    end
  end

  # GET /borrowers/new
  # GET /borrowers/new.json
  def new
    @borrower = Borrower.new
    @event = Event.find(params[:event_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @borrower }
    end
  end

  # GET /borrowers/1/edit
  def edit
    @borrower = Borrower.find(params[:id])
    @event = @borrower.event
  end

  # POST /borrowers
  # POST /borrowers.json
  def create
    @event = Event.find(params[:borrower][:event_id])

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
    
    @borrower = Borrower.new(params[:borrower])
    respond_to do |format|
      if @borrower.save
        if @borrower.event.is_general?
          format.html { redirect_to borrowers_url, notice: 'Borrower was successfully created.' }
        else
          format.html { redirect_to event_url(@borrower.event), notice: 'Borrower was successfully created.' }
        end  
        format.json { render json: @borrower, status: :created, location: @borrower }
      else
        format.html { render action: "new" }
        format.json { render json: @borrower.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /borrowers/1
  # PUT /borrowers/1.json
  def update
    @borrower = Borrower.find(params[:id])
    params[:borrower][:start_date] = Date.strptime(params[:borrower][:start_date], "%m/%d/%Y")
    params[:borrower][:end_date] = Date.strptime(params[:borrower][:end_date], "%m/%d/%Y")
    
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
        format.json { render json: @borrower.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrowers/1
  # DELETE /borrowers/1.json
  def destroy
    @borrower = Borrower.find(params[:id])
    @event = @borrower.event
    @borrower.destroy

    respond_to do |format|
      format.html { redirect_to event_url(@event) }
      format.json { head :no_content }
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
end
