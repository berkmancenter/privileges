class SearchController < ApplicationController
  before_filter :authenticate_admin!
    
  def index
    @borrowers = Borrower.search(params[:search].downcase)
    p "borrowers"
    p @borrowers
  end
end
