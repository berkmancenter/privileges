class SearchController < ApplicationController
  before_filter :authenticate_admin!
    
  def index
    @borrowers = Borrower.search(params[:search].downcase)
    @attendees = Attendee.search(params[:search].downcase)
    @events = Event.search(params[:search].downcase)
  end
end
