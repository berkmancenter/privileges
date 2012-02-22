class CardTypesController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @card_types = CardType.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @card_type = CardType.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @card_type = CardType.find(params[:id])
  end

  def create
    @card_type = CardType.new(params[:card_type])

    respond_to do |format|
      if @card_type.save
        format.html { redirect_to card_types_url, notice: 'Card type was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @card_type = CardType.find(params[:id])

    respond_to do |format|
      if @card_type.update_attributes(params[:card_type])
        format.html { redirect_to card_types_url, notice: 'Card type was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @card_type = CardType.find(params[:id])
    @card_type.destroy

    respond_to do |format|
      format.html { redirect_to card_types_url }
    end
  end
end
